/**
 * Checkout Service - Утилиты для отправки заказа на сервер OpenCart
 */

import type { CartItem } from '../components/CartContext'

// Типы для OpenCart API
export interface CheckoutPayload {
  certificates: Array<{
    certificate_category: "thematic" | "nominal"
    theme: string | null
    format: "electronic" | "envelope" | "gift_box"
    design_id: number
    amount: number
    wishes: string
    recipient_name: string
    validity_start: "immediate" | string
    validity_date: string | null
  }>
  customer: {
    firstname: string
    lastname: string
    telephone: string
    email: string
    comment: string
  }
  delivery: {
    needed: boolean
    method: "email" | "pickup" | "courier_express" | "courier_standard" | "pvz"
    cost: number
    address: {
      city: string
      street: string
      apartment: string
      postal_code: string
      entrance?: string
      floor?: string
      intercom?: string
      comment?: string
    }
    pickup_point: {
      id: string
      address: string
      work_time: string
      phone: string
      provider: "yandex"
    } | null
  }
  totals: {
    certificates_total: number
    delivery_total: number
    grand_total: number
  }
  customerDate: string
  source: "website"
}

interface FormDataInput {
  firstName: string
  lastName: string
  phone: string
  email: string
  message?: string
  comment?: string
  agreedToTerms: boolean
}

interface DeliveryData {
  deliveryMethod: 'electronic' | 'envelope' | 'gift-package'
  selectedEnvelope?: string
  selectedPackaging?: string
  deliveryLocation?: string
  moscowDeliveryMethod?: string
  selectedPickupPoint?: string
  deliveryAddressStreet?: string
  deliveryAddressApartment?: string
  deliveryAddressEntrance?: string
  deliveryAddressFloor?: string
  deliveryAddressIntercom?: string
  deliveryComment?: string
}

/**
 * Конвертирует формат доставки в format для API
 */
function mapDeliveryFormat(deliveryMethod: string): "electronic" | "envelope" | "gift_box" {
  switch (deliveryMethod) {
    case 'electronic':
      return 'electronic'
    case 'envelope':
      return 'envelope'
    case 'gift-package':
      return 'gift_box'
    default:
      return 'electronic'
  }
}

/**
 * Конвертирует способ доставки в method для API
 */
function mapDeliveryMethod(
  deliveryMethod: string,
  moscowDeliveryMethod?: string
): "email" | "pickup" | "courier_express" | "courier_standard" | "pvz" {
  if (deliveryMethod === 'electronic') {
    return 'email'
  }

  switch (moscowDeliveryMethod) {
    case 'pickup':
      return 'pickup'
    case 'express':
      return 'courier_express'
    case 'courier':
      return 'courier_standard'
    case 'pickup-point':
      return 'pvz'
    default:
      return 'email'
  }
}

/**
 * Получает design_id из selectedEnvelope или selectedPackaging
 */
function getDesignId(selectedEnvelope?: string, selectedPackaging?: string): number {
  if (selectedEnvelope) {
    // Маппинг ID конвертов
    const envelopeMap: Record<string, number> = {
      'forest-dome': 1,
      'sunset': 2,
      'lavender': 3,
      'van': 4
    }
    return envelopeMap[selectedEnvelope] || 1
  }

  if (selectedPackaging) {
    // Маппинг ID упаковки
    const packagingMap: Record<string, number> = {
      'premium': 1,
      'premium-mountain': 2,
      'premium-lavender': 3,
      'premium-van': 4
    }
    return packagingMap[selectedPackaging] || 1
  }

  return 1 // default
}

/**
 * Вычисляет стоимость доставки
 */
function calculateDeliveryCost(
  deliveryMethod: string,
  moscowDeliveryMethod?: string
): number {
  if (deliveryMethod === 'electronic') {
    return 0
  }

  // Базовая стоимость упаковки
  let cost = 0
  if (deliveryMethod === 'envelope') {
    cost = 290
  } else if (deliveryMethod === 'gift-package') {
    cost = 1190
  }

  // Добавляем стоимость доставки
  switch (moscowDeliveryMethod) {
    case 'pickup':
      return cost + 0
    case 'express':
      return cost + 900
    case 'courier':
      return cost + 450
    case 'pickup-point':
      return cost + 300
    default:
      return cost
  }
}

/**
 * Конвертирует данные формы и корзины в CheckoutPayload для OpenCart
 */
export function convertToCheckoutPayload(
  items: CartItem[],
  formData: FormDataInput,
  deliveryData: DeliveryData
): CheckoutPayload {
  // Конвертируем товары корзины в certificates
  const certificates = items.map(item => ({
    certificate_category: "thematic" as const, // Все сертификаты тематические
    theme: item.category || null, // Тема из категории
    format: mapDeliveryFormat(deliveryData.deliveryMethod),
    design_id: getDesignId(deliveryData.selectedEnvelope, deliveryData.selectedPackaging),
    amount: item.price * item.nights * item.quantity,
    wishes: formData.message || '',
    recipient_name: `${formData.firstName} ${formData.lastName}`,
    validity_start: "immediate" as const,
    validity_date: null
  }))

  // Определяем нужна ли физическая доставка
  const needsPhysicalDelivery = deliveryData.deliveryMethod !== 'electronic'

  // Формируем данные доставки
  const deliveryCost = calculateDeliveryCost(
    deliveryData.deliveryMethod,
    deliveryData.moscowDeliveryMethod
  )

  // Считаем общие суммы
  const certificatesTotal = items.reduce(
    (sum, item) => sum + (item.price * item.nights * item.quantity),
    0
  )

  const payload: CheckoutPayload = {
    certificates,
    customer: {
      firstname: formData.firstName,
      lastname: formData.lastName,
      telephone: formData.phone,
      email: formData.email,
      comment: formData.comment || ''
    },
    delivery: {
      needed: needsPhysicalDelivery,
      method: mapDeliveryMethod(deliveryData.deliveryMethod, deliveryData.moscowDeliveryMethod),
      cost: deliveryCost,
      address: needsPhysicalDelivery ? {
        city: deliveryData.deliveryLocation === 'spb' ? 'Санкт-Петербург' : 'Москва',
        street: deliveryData.deliveryAddressStreet || '',
        apartment: deliveryData.deliveryAddressApartment || '',
        postal_code: '',
        entrance: deliveryData.deliveryAddressEntrance,
        floor: deliveryData.deliveryAddressFloor,
        intercom: deliveryData.deliveryAddressIntercom,
        comment: deliveryData.deliveryComment
      } : {} as any,
      pickup_point: deliveryData.selectedPickupPoint ? {
        id: deliveryData.selectedPickupPoint,
        address: 'Адрес из справочника ПВЗ', // TODO: получать из pickupPoints массива
        work_time: 'пн-вс: 09.00-21.00',
        phone: '+74951570020',
        provider: 'yandex'
      } : null
    },
    totals: {
      certificates_total: certificatesTotal,
      delivery_total: deliveryCost,
      grand_total: certificatesTotal + deliveryCost
    },
    customerDate: new Date().toISOString().split('T')[0],
    source: 'website'
  }

  return payload
}

/**
 * Отправляет заказ на сервер OpenCart и обрабатывает ответ
 */
export async function submitCheckout(payload: CheckoutPayload): Promise<void> {
  try {
    console.log('=== ОТПРАВКА ЗАКАЗА НА СЕРВЕР ===')
    console.log('Payload:', JSON.stringify(payload, null, 2))

    const response = await fetch('/index.php?route=gift/checkout', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(payload)
    })

    if (!response.ok) {
      const errorText = await response.text()
      console.error('Server error:', errorText)
      throw new Error(`HTTP error! status: ${response.status}`)
    }

    // Получаем HTML форму Tinkoff
    const htmlForm = await response.text()

    if (!htmlForm || htmlForm.trim() === '') {
      throw new Error('Empty response from server')
    }

    console.log('=== ПОЛУЧЕНА ФОРМА TINKOFF ===')

    // Создаём временный div, вставляем форму, auto-submit
    const tempDiv = document.createElement('div')
    tempDiv.style.display = 'none'
    tempDiv.innerHTML = htmlForm
    document.body.appendChild(tempDiv)

    const form = tempDiv.querySelector('form')
    if (form) {
      console.log('=== ОТПРАВКА ФОРМЫ TINKOFF ===')
      form.submit() // Редирект на Tinkoff
    } else {
      throw new Error('Payment form not found in response')
    }

  } catch (error) {
    console.error('=== ОШИБКА ОТПРАВКИ ЗАКАЗА ===', error)
    throw error
  }
}

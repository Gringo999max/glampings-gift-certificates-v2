import React, { Suspense } from "react";
import { Toaster } from "./components/ui/sonner";
import { CartProvider } from "./components/CartContext";
import { FloatingCartButton } from "./components/FloatingCartButton";
import { ErrorBoundary } from "./components/ErrorBoundary";

// Import home page components
import Header from "./components/Header";
import HeroSection from "./components/HeroSection";
import ExtendedGlampingSection from "./components/ExtendedGlampingSection";
import GiftOptionsSection from "./components/GiftOptionsSection";
import ReviewsSection from "./components/ReviewsSection";
import CorporateGiftSection from "./components/CorporateGiftSection";
import HowItWorksSection from "./components/HowItWorksSection";
import FAQSection from "./components/FAQSection";
import RegionsSection from "./components/RegionsSection";
import PromoSection from "./components/PromoSection";
import Footer from "./components/Footer";

// Lazy load page components for development routing
const DeliveryPaymentPage = React.lazy(
  () => import("./components/DeliveryPaymentPage"),
);
const CorporateB2BPage = React.lazy(
  () => import("./components/CorporateB2BPage"),
);
const ReviewsPage = React.lazy(
  () => import("./components/ReviewsPage"),
);
const AboutPage = React.lazy(
  () => import("./components/AboutPage"),
);
const CertificateActivationPage = React.lazy(
  () => import("./components/CertificateActivationPage"),
);
const PetFriendlyGlampingPage = React.lazy(
  () => import("./components/PetFriendlyGlampingPage"),
);
const HowItWorksPage = React.lazy(
  () => import("./components/HowItWorksPage"),
);

// Loading spinner for lazy loaded pages
const LoadingSpinner = () => (
  <div className="min-h-screen flex items-center justify-center bg-white">
    <div className="flex flex-col items-center gap-4">
      <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-emerald-600"></div>
      <p className="text-sm text-gray-600">Загружаем страницу...</p>
    </div>
  </div>
);

// Error fallback component
const ErrorFallback = ({ error }: { error: Error }) => (
  <div className="min-h-screen flex items-center justify-center bg-white p-6">
    <div className="text-center space-y-4">
      <h2 className="text-lg font-semibold text-gray-900">
        Что-то пошло не так
      </h2>
      <p className="text-sm text-gray-600">
        Произошла ошибка при загрузке страницы
      </p>
      <button
        onClick={() => window.location.reload()}
        className="px-4 py-2 bg-emerald-600 text-white rounded-lg hover:bg-emerald-700 transition-colors"
      >
        Перезагрузить страницу
      </button>
    </div>
  </div>
);

// Home Page Component - Main React SPA Page
function HomePage() {
  return (
    <div className="min-h-screen bg-white">
      <Header />
      <HeroSection />
      <ExtendedGlampingSection />
      <GiftOptionsSection />
      <ReviewsSection />
      <CorporateGiftSection />
      <HowItWorksSection />
      <FAQSection />
      <RegionsSection />
      <PromoSection />
      <Footer />
    </div>
  );
}

// Development-only routing wrapper
function DevRouter({ children }: { children: React.ReactNode }) {
  // Only use React Router in development mode
  if (import.meta.env.DEV) {
    const { BrowserRouter, Routes, Route, Navigate } = require('react-router-dom');

    return (
      <BrowserRouter>
        <Routes>
          <Route path="/" element={children} />

          <Route
            path="/delivery"
            element={
              <Suspense fallback={<LoadingSpinner />}>
                <DeliveryPaymentPage />
              </Suspense>
            }
          />

          <Route
            path="/reviews"
            element={
              <Suspense fallback={<LoadingSpinner />}>
                <ReviewsPage />
              </Suspense>
            }
          />

          <Route
            path="/how-it-works"
            element={
              <Suspense fallback={<LoadingSpinner />}>
                <HowItWorksPage />
              </Suspense>
            }
          />

          <Route
            path="/corporate"
            element={
              <Suspense fallback={<LoadingSpinner />}>
                <CorporateB2BPage />
              </Suspense>
            }
          />

          <Route
            path="/about"
            element={
              <Suspense fallback={<LoadingSpinner />}>
                <AboutPage />
              </Suspense>
            }
          />

          <Route
            path="/activate"
            element={
              <Suspense fallback={<LoadingSpinner />}>
                <CertificateActivationPage />
              </Suspense>
            }
          />

          <Route
            path="/certificates/pet-friendly"
            element={
              <Suspense fallback={<LoadingSpinner />}>
                <PetFriendlyGlampingPage />
              </Suspense>
            }
          />

          <Route path="*" element={<Navigate to="/" replace />} />
        </Routes>
      </BrowserRouter>
    );
  }

  // In production (OpenCart), just render children without routing
  return <>{children}</>;
}

export default function App() {
  return (
    <ErrorBoundary fallback={ErrorFallback}>
      <CartProvider>
        <DevRouter>
          <HomePage />
        </DevRouter>
        <FloatingCartButton />
        <Toaster />
      </CartProvider>
    </ErrorBoundary>
  );
}

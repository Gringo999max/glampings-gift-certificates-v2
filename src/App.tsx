import React, { Suspense } from "react";
import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom";
import { Toaster } from "./components/ui/sonner";
import { CartProvider } from "./components/CartContext";
import { FloatingCartButton } from "./components/FloatingCartButton";
import { ErrorBoundary } from "./components/ErrorBoundary";

// Import only essential home page components synchronously
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

// Lazy load page components to improve initial load time
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

// Enhanced loading component with better UX
const LoadingSpinner = () => (
  <div className="min-h-screen flex items-center justify-center bg-white">
    <div className="flex flex-col items-center gap-4">
      <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-emerald-600"></div>
      <p className="text-sm text-gray-600">
        Загружаем страницу...
      </p>
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

// Home Page Component
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

export default function App() {
  return (
    <ErrorBoundary fallback={ErrorFallback}>
      <BrowserRouter>
        <CartProvider>
          <ErrorBoundary>
            <Routes>
              {/* Main Pages */}
              <Route path="/" element={<HomePage />} />

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

              {/* Certificate Types */}
              <Route
                path="/certificates/pet-friendly"
                element={
                  <Suspense fallback={<LoadingSpinner />}>
                    <PetFriendlyGlampingPage />
                  </Suspense>
                }
              />

              {/* TODO: Add other certificate types as needed:
                  /certificates/romantic
                  /certificates/family
                  /certificates/extreme
                  /certificates/relax
                  /certificates/nominal
              */}

              {/* 404 - Redirect to home */}
              <Route path="*" element={<Navigate to="/" replace />} />
            </Routes>
          </ErrorBoundary>

          <FloatingCartButton />
          <Toaster />
        </CartProvider>
      </BrowserRouter>
    </ErrorBoundary>
  );
}

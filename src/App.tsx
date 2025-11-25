import React from "react";
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

export default function App() {
  return (
    <ErrorBoundary fallback={ErrorFallback}>
      <CartProvider>
        <HomePage />
        <FloatingCartButton />
        <Toaster />
      </CartProvider>
    </ErrorBoundary>
  );
}

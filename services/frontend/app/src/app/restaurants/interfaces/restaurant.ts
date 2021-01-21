export interface Restaurant {
  id: string;
  alias: string;
  name: string;
  imageUrl: string;
  url: string;
  phone: string;
  reviewCount: number;
  categories: string[];
  rating: number;
  city: string;
  zipcode: string;
  country: string;
  address: string;
  latitude: number;
  longitude: number;
  photos: string[];
  price: string;
  distance: number;
}
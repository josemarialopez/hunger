export interface GetRestaurantsParameters {
  term?: string;
  location?: string;
  radius?: number;
  categories?: string[];
  prices?: number[]
}

export interface FoodDto {
  id: number;
  title: string;
  price: number;
  discount?: number;
  imagePath: string;
  rating?: number;
  stars?: number;
  categoryName: String;
}

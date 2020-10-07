import { FoodDto } from '../dtos/food.dto';

export interface IHomeService {
  getFoods(): Promise<FoodDto[]>;
  getFood(id: number): Promise<FoodDto>;
}

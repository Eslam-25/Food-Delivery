import { Injectable } from '@nestjs/common';
import { FoodRepository } from 'infrastructure/database/repositories/food.repository';
import { FoodDto } from '../dtos/food.dto';
import { IHomeService } from '../interfaces/i-home.service';
import FoodMapper from '../mappers/food.mapper';

@Injectable()
export default class HomeService implements IHomeService {
  constructor(private readonly foodRepository: FoodRepository) {}

  async getFoods(): Promise<FoodDto[]> {
    const foodsDB = await this.foodRepository.getFoods();
    return FoodMapper.mapToDtos(foodsDB);
  }
  async getFood(id: number): Promise<FoodDto> {
    const foodDB = await this.foodRepository.getFood(id);
    return FoodMapper.mapToDto(foodDB);
  }
}

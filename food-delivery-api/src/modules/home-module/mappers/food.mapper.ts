import { Food } from 'infrastructure/database/entities/food.entity';
import { FoodDto } from '../dtos/food.dto';

export default class FoodMapper {
  public static mapToDto(food: Food): FoodDto {
    const foodDto: FoodDto = {
      id: food.id,
      title: food.title,
      categoryName: food.category.title,
      discount: food.discount,
      imagePath: food.imagePath,
      price: food.price,
      rating: food.rating,
      stars: food.stars,
    };

    return foodDto;
  }

  public static mapToDtos(foods: Food[]): FoodDto[] {
    const foodDtos: FoodDto[] = [];
    foods.forEach((food: Food) => {
      foodDtos.push({
        id: food.id,
        title: food.title,
        categoryName: food.category.title,
        discount: food.discount,
        imagePath: food.imagePath,
        price: food.price,
        rating: food.rating,
        stars: food.stars,
      });
    });

    return foodDtos;
  }
}

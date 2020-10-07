import { injectable } from 'inversify';
import { EntityRepository } from 'typeorm';
import { Repository } from '../common/generic.repository';
import { Food } from '../entities/food.entity';

@injectable()
@EntityRepository(Food)
export class FoodRepository extends Repository<Food> {
  constructor() {
    super(Food);
  }

  getFoods(): Promise<Food[]> {
    return this.custom()
      .createQueryBuilder('food')
      .leftJoinAndSelect(
        'food.category',
        'category',
        'category.isActive= :isActive',
        { isActive: true },
      )
      .select(['food', 'category.title'])
      .where('food.isActive= :isActive', { isActive: true })
      .getMany();
  }

  getFood(id: number): Promise<Food> {
    return this.custom()
      .createQueryBuilder('food')
      .leftJoinAndSelect(
        'food.category',
        'category',
        'category.isActive= :isActive',
        { isActive: true },
      )
      .select(['food', 'category.title'])
      .where('food.isActive= :isActive and food.id = :id', {
        isActive: true,
        id: id,
      })
      .getOne();
  }

  addFood(addedFood: Food) {
    this.save(addedFood);
  }

  updateFood(updatedFood: Food) {
    this.save(updatedFood);
  }
}

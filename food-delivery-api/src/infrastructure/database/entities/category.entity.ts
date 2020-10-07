import { Column, Entity, OneToMany } from 'typeorm';
import { BaseDbEntity } from './base-db.entity';
import { Food } from './food.entity';

@Entity({ name: 'category' })
export class Category extends BaseDbEntity {
  @Column({ type: 'varchar' })
  title: string;

  @OneToMany(
    () => Food,
    (food: Food) => food.category,
  )
  foods: Food[];
}

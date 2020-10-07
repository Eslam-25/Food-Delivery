import { Column, Entity, ManyToOne } from 'typeorm';
import { BaseDbEntity } from './base-db.entity';
import { Category } from './category.entity';

@Entity('foods')
export class Food extends BaseDbEntity {
  @Column({ type: 'varchar' })
  title: string;
  @Column({ type: 'float' })
  price: number;
  @Column({ type: 'float', nullable: true })
  discount?: number;
  @Column({ type: 'varchar' })
  imagePath: string;
  @Column({ type: 'float' })
  rating?: number;
  @Column({ type: 'int' })
  stars?: number;

  @ManyToOne(
    () => Category,
    (category: Category) => category.foods,
  )
  category: Category;
}

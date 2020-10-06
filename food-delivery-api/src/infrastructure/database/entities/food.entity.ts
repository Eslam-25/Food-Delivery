import { Column, Entity } from 'typeorm';
import { BaseDbEntity } from './base-db.entity';

@Entity('foods')
export class Food extends BaseDbEntity {
  @Column({ type: 'varchar' })
  title: string;
  @Column({ type: 'decimal' })
  price: number;
  @Column({ type: 'decimal', nullable: true })
  discount: number;
  @Column({ type: 'varchar' })
  image_path: string;

  // category_id:number;
}

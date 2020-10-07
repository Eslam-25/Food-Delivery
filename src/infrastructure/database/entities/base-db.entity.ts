import {
  PrimaryGeneratedColumn,
  CreateDateColumn,
  Column,
  UpdateDateColumn,
} from 'typeorm';

export class BaseDbEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @CreateDateColumn({})
  createdAt?: Date;

  @UpdateDateColumn({ nullable: true })
  updatedAt?: Date;

  @Column({ default: true })
  isActive?: boolean;
}

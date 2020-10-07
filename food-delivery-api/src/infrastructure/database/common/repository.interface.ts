import { Query } from './query.object';
import { FindOneOptions, FindManyOptions } from 'typeorm';

export interface IRepository<E, R> {
  custom(): R;
  delete(
    condition: string | number | { [key: string]: string | number } | E,
  ): Promise<boolean>;
  deleteAll(condition: string[] | number[] | E[]): Promise<boolean>;
  find(id: number, options?: FindOneOptions): Promise<E | undefined>;
  findAll(options?: FindManyOptions): Promise<E[]>;
  findBy(condition: Query<E>): Promise<E[]>;
  findMany(ids: string[]): Promise<E[]>;
  query(query: string, parameters?: any[]): Promise<E[]>;
  remove(entity: E): Promise<E>;
  removeAll(entities: E[]): Promise<E[]>;
  save(entity: E): Promise<E>;
  saveAll(entities: E[]): Promise<E[]>;
  update(condition: string | number, data: E): Promise<boolean>;
  updateAll(condition: string[] | number[], data: E): Promise<boolean>;
}

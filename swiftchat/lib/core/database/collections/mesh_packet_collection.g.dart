// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mesh_packet_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMeshPacketCollectionCollection on Isar {
  IsarCollection<MeshPacketCollection> get meshPacketCollections =>
      this.collection();
}

const MeshPacketCollectionSchema = CollectionSchema(
  name: r'MeshPacketCollection',
  id: -7426234822012754952,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'messageHash': PropertySchema(
      id: 1,
      name: r'messageHash',
      type: IsarType.string,
    ),
    r'payload': PropertySchema(id: 2, name: r'payload', type: IsarType.string),
    r'recipientId': PropertySchema(
      id: 3,
      name: r'recipientId',
      type: IsarType.string,
    ),
    r'ttl': PropertySchema(id: 4, name: r'ttl', type: IsarType.dateTime),
  },

  estimateSize: _meshPacketCollectionEstimateSize,
  serialize: _meshPacketCollectionSerialize,
  deserialize: _meshPacketCollectionDeserialize,
  deserializeProp: _meshPacketCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'messageHash': IndexSchema(
      id: 3786301368058515294,
      name: r'messageHash',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'messageHash',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'recipientId': IndexSchema(
      id: 3707675062653042085,
      name: r'recipientId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'recipientId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'ttl': IndexSchema(
      id: 5079547260154789438,
      name: r'ttl',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'ttl',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _meshPacketCollectionGetId,
  getLinks: _meshPacketCollectionGetLinks,
  attach: _meshPacketCollectionAttach,
  version: '3.3.2',
);

int _meshPacketCollectionEstimateSize(
  MeshPacketCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.messageHash.length * 3;
  bytesCount += 3 + object.payload.length * 3;
  bytesCount += 3 + object.recipientId.length * 3;
  return bytesCount;
}

void _meshPacketCollectionSerialize(
  MeshPacketCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.messageHash);
  writer.writeString(offsets[2], object.payload);
  writer.writeString(offsets[3], object.recipientId);
  writer.writeDateTime(offsets[4], object.ttl);
}

MeshPacketCollection _meshPacketCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MeshPacketCollection();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.id = id;
  object.messageHash = reader.readString(offsets[1]);
  object.payload = reader.readString(offsets[2]);
  object.recipientId = reader.readString(offsets[3]);
  object.ttl = reader.readDateTime(offsets[4]);
  return object;
}

P _meshPacketCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _meshPacketCollectionGetId(MeshPacketCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _meshPacketCollectionGetLinks(
  MeshPacketCollection object,
) {
  return [];
}

void _meshPacketCollectionAttach(
  IsarCollection<dynamic> col,
  Id id,
  MeshPacketCollection object,
) {
  object.id = id;
}

extension MeshPacketCollectionByIndex on IsarCollection<MeshPacketCollection> {
  Future<MeshPacketCollection?> getByMessageHash(String messageHash) {
    return getByIndex(r'messageHash', [messageHash]);
  }

  MeshPacketCollection? getByMessageHashSync(String messageHash) {
    return getByIndexSync(r'messageHash', [messageHash]);
  }

  Future<bool> deleteByMessageHash(String messageHash) {
    return deleteByIndex(r'messageHash', [messageHash]);
  }

  bool deleteByMessageHashSync(String messageHash) {
    return deleteByIndexSync(r'messageHash', [messageHash]);
  }

  Future<List<MeshPacketCollection?>> getAllByMessageHash(
    List<String> messageHashValues,
  ) {
    final values = messageHashValues.map((e) => [e]).toList();
    return getAllByIndex(r'messageHash', values);
  }

  List<MeshPacketCollection?> getAllByMessageHashSync(
    List<String> messageHashValues,
  ) {
    final values = messageHashValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'messageHash', values);
  }

  Future<int> deleteAllByMessageHash(List<String> messageHashValues) {
    final values = messageHashValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'messageHash', values);
  }

  int deleteAllByMessageHashSync(List<String> messageHashValues) {
    final values = messageHashValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'messageHash', values);
  }

  Future<Id> putByMessageHash(MeshPacketCollection object) {
    return putByIndex(r'messageHash', object);
  }

  Id putByMessageHashSync(
    MeshPacketCollection object, {
    bool saveLinks = true,
  }) {
    return putByIndexSync(r'messageHash', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByMessageHash(List<MeshPacketCollection> objects) {
    return putAllByIndex(r'messageHash', objects);
  }

  List<Id> putAllByMessageHashSync(
    List<MeshPacketCollection> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'messageHash', objects, saveLinks: saveLinks);
  }
}

extension MeshPacketCollectionQueryWhereSort
    on QueryBuilder<MeshPacketCollection, MeshPacketCollection, QWhere> {
  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterWhere>
  anyTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'ttl'),
      );
    });
  }
}

extension MeshPacketCollectionQueryWhere
    on QueryBuilder<MeshPacketCollection, MeshPacketCollection, QWhereClause> {
  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterWhereClause>
  messageHashEqualTo(String messageHash) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'messageHash',
          value: [messageHash],
        ),
      );
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterWhereClause>
  messageHashNotEqualTo(String messageHash) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'messageHash',
                lower: [],
                upper: [messageHash],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'messageHash',
                lower: [messageHash],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'messageHash',
                lower: [messageHash],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'messageHash',
                lower: [],
                upper: [messageHash],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterWhereClause>
  recipientIdEqualTo(String recipientId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'recipientId',
          value: [recipientId],
        ),
      );
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterWhereClause>
  recipientIdNotEqualTo(String recipientId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recipientId',
                lower: [],
                upper: [recipientId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recipientId',
                lower: [recipientId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recipientId',
                lower: [recipientId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recipientId',
                lower: [],
                upper: [recipientId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterWhereClause>
  ttlEqualTo(DateTime ttl) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'ttl', value: [ttl]),
      );
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterWhereClause>
  ttlNotEqualTo(DateTime ttl) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'ttl',
                lower: [],
                upper: [ttl],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'ttl',
                lower: [ttl],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'ttl',
                lower: [ttl],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'ttl',
                lower: [],
                upper: [ttl],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterWhereClause>
  ttlGreaterThan(DateTime ttl, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'ttl',
          lower: [ttl],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterWhereClause>
  ttlLessThan(DateTime ttl, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'ttl',
          lower: [],
          upper: [ttl],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterWhereClause>
  ttlBetween(
    DateTime lowerTtl,
    DateTime upperTtl, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'ttl',
          lower: [lowerTtl],
          includeLower: includeLower,
          upper: [upperTtl],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension MeshPacketCollectionQueryFilter
    on
        QueryBuilder<
          MeshPacketCollection,
          MeshPacketCollection,
          QFilterCondition
        > {
  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  messageHashEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'messageHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  messageHashGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'messageHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  messageHashLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'messageHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  messageHashBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'messageHash',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  messageHashStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'messageHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  messageHashEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'messageHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  messageHashContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'messageHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  messageHashMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'messageHash',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  messageHashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'messageHash', value: ''),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  messageHashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'messageHash', value: ''),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  payloadEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'payload',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  payloadGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'payload',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  payloadLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'payload',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  payloadBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'payload',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  payloadStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'payload',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  payloadEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'payload',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  payloadContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'payload',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  payloadMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'payload',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  payloadIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'payload', value: ''),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  payloadIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'payload', value: ''),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  recipientIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'recipientId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  recipientIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'recipientId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  recipientIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'recipientId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  recipientIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'recipientId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  recipientIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'recipientId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  recipientIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'recipientId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  recipientIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'recipientId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  recipientIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'recipientId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  recipientIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'recipientId', value: ''),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  recipientIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'recipientId', value: ''),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  ttlEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'ttl', value: value),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  ttlGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'ttl',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  ttlLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'ttl',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MeshPacketCollection,
    MeshPacketCollection,
    QAfterFilterCondition
  >
  ttlBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'ttl',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension MeshPacketCollectionQueryObject
    on
        QueryBuilder<
          MeshPacketCollection,
          MeshPacketCollection,
          QFilterCondition
        > {}

extension MeshPacketCollectionQueryLinks
    on
        QueryBuilder<
          MeshPacketCollection,
          MeshPacketCollection,
          QFilterCondition
        > {}

extension MeshPacketCollectionQuerySortBy
    on QueryBuilder<MeshPacketCollection, MeshPacketCollection, QSortBy> {
  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterSortBy>
  sortByMessageHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'messageHash', Sort.asc);
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterSortBy>
  sortByMessageHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'messageHash', Sort.desc);
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterSortBy>
  sortByPayload() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payload', Sort.asc);
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterSortBy>
  sortByPayloadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payload', Sort.desc);
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterSortBy>
  sortByRecipientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recipientId', Sort.asc);
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterSortBy>
  sortByRecipientIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recipientId', Sort.desc);
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterSortBy>
  sortByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.asc);
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterSortBy>
  sortByTtlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.desc);
    });
  }
}

extension MeshPacketCollectionQuerySortThenBy
    on QueryBuilder<MeshPacketCollection, MeshPacketCollection, QSortThenBy> {
  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterSortBy>
  thenByMessageHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'messageHash', Sort.asc);
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterSortBy>
  thenByMessageHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'messageHash', Sort.desc);
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterSortBy>
  thenByPayload() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payload', Sort.asc);
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterSortBy>
  thenByPayloadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payload', Sort.desc);
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterSortBy>
  thenByRecipientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recipientId', Sort.asc);
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterSortBy>
  thenByRecipientIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recipientId', Sort.desc);
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterSortBy>
  thenByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.asc);
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QAfterSortBy>
  thenByTtlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.desc);
    });
  }
}

extension MeshPacketCollectionQueryWhereDistinct
    on QueryBuilder<MeshPacketCollection, MeshPacketCollection, QDistinct> {
  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QDistinct>
  distinctByMessageHash({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'messageHash', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QDistinct>
  distinctByPayload({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'payload', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QDistinct>
  distinctByRecipientId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recipientId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MeshPacketCollection, MeshPacketCollection, QDistinct>
  distinctByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ttl');
    });
  }
}

extension MeshPacketCollectionQueryProperty
    on
        QueryBuilder<
          MeshPacketCollection,
          MeshPacketCollection,
          QQueryProperty
        > {
  QueryBuilder<MeshPacketCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MeshPacketCollection, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<MeshPacketCollection, String, QQueryOperations>
  messageHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'messageHash');
    });
  }

  QueryBuilder<MeshPacketCollection, String, QQueryOperations>
  payloadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'payload');
    });
  }

  QueryBuilder<MeshPacketCollection, String, QQueryOperations>
  recipientIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recipientId');
    });
  }

  QueryBuilder<MeshPacketCollection, DateTime, QQueryOperations> ttlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ttl');
    });
  }
}

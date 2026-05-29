// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMessageCollectionCollection on Isar {
  IsarCollection<MessageCollection> get messageCollections => this.collection();
}

const MessageCollectionSchema = CollectionSchema(
  name: r'MessageCollection',
  id: -7394621338610000233,
  properties: {
    r'chatPartnerId': PropertySchema(
      id: 0,
      name: r'chatPartnerId',
      type: IsarType.string,
    ),
    r'content': PropertySchema(id: 1, name: r'content', type: IsarType.string),
    r'isDirect': PropertySchema(id: 2, name: r'isDirect', type: IsarType.bool),
    r'messageId': PropertySchema(
      id: 3,
      name: r'messageId',
      type: IsarType.string,
    ),
    r'recipientId': PropertySchema(
      id: 4,
      name: r'recipientId',
      type: IsarType.string,
    ),
    r'senderId': PropertySchema(
      id: 5,
      name: r'senderId',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 6,
      name: r'status',
      type: IsarType.byte,
      enumMap: _MessageCollectionstatusEnumValueMap,
    ),
    r'timestamp': PropertySchema(
      id: 7,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'ttl': PropertySchema(id: 8, name: r'ttl', type: IsarType.dateTime),
  },

  estimateSize: _messageCollectionEstimateSize,
  serialize: _messageCollectionSerialize,
  deserialize: _messageCollectionDeserialize,
  deserializeProp: _messageCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'messageId': IndexSchema(
      id: -635287409172016016,
      name: r'messageId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'messageId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'chatPartnerId': IndexSchema(
      id: -4013380928438157100,
      name: r'chatPartnerId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'chatPartnerId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'timestamp': IndexSchema(
      id: 1852253767416892198,
      name: r'timestamp',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'timestamp',
          type: IndexType.value,
          caseSensitive: false,
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

  getId: _messageCollectionGetId,
  getLinks: _messageCollectionGetLinks,
  attach: _messageCollectionAttach,
  version: '3.3.2',
);

int _messageCollectionEstimateSize(
  MessageCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.chatPartnerId.length * 3;
  bytesCount += 3 + object.content.length * 3;
  bytesCount += 3 + object.messageId.length * 3;
  bytesCount += 3 + object.recipientId.length * 3;
  bytesCount += 3 + object.senderId.length * 3;
  return bytesCount;
}

void _messageCollectionSerialize(
  MessageCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.chatPartnerId);
  writer.writeString(offsets[1], object.content);
  writer.writeBool(offsets[2], object.isDirect);
  writer.writeString(offsets[3], object.messageId);
  writer.writeString(offsets[4], object.recipientId);
  writer.writeString(offsets[5], object.senderId);
  writer.writeByte(offsets[6], object.status.index);
  writer.writeDateTime(offsets[7], object.timestamp);
  writer.writeDateTime(offsets[8], object.ttl);
}

MessageCollection _messageCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MessageCollection();
  object.chatPartnerId = reader.readString(offsets[0]);
  object.content = reader.readString(offsets[1]);
  object.id = id;
  object.isDirect = reader.readBool(offsets[2]);
  object.messageId = reader.readString(offsets[3]);
  object.recipientId = reader.readString(offsets[4]);
  object.senderId = reader.readString(offsets[5]);
  object.status =
      _MessageCollectionstatusValueEnumMap[reader.readByteOrNull(offsets[6])] ??
      MessageStatus.pending;
  object.timestamp = reader.readDateTime(offsets[7]);
  object.ttl = reader.readDateTime(offsets[8]);
  return object;
}

P _messageCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (_MessageCollectionstatusValueEnumMap[reader.readByteOrNull(
                offset,
              )] ??
              MessageStatus.pending)
          as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MessageCollectionstatusEnumValueMap = {
  'pending': 0,
  'sent': 1,
  'delivered': 2,
};
const _MessageCollectionstatusValueEnumMap = {
  0: MessageStatus.pending,
  1: MessageStatus.sent,
  2: MessageStatus.delivered,
};

Id _messageCollectionGetId(MessageCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _messageCollectionGetLinks(
  MessageCollection object,
) {
  return [];
}

void _messageCollectionAttach(
  IsarCollection<dynamic> col,
  Id id,
  MessageCollection object,
) {
  object.id = id;
}

extension MessageCollectionQueryWhereSort
    on QueryBuilder<MessageCollection, MessageCollection, QWhere> {
  QueryBuilder<MessageCollection, MessageCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterWhere>
  anyTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'timestamp'),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterWhere> anyTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'ttl'),
      );
    });
  }
}

extension MessageCollectionQueryWhere
    on QueryBuilder<MessageCollection, MessageCollection, QWhereClause> {
  QueryBuilder<MessageCollection, MessageCollection, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterWhereClause>
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

  QueryBuilder<MessageCollection, MessageCollection, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterWhereClause>
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

  QueryBuilder<MessageCollection, MessageCollection, QAfterWhereClause>
  messageIdEqualTo(String messageId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'messageId', value: [messageId]),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterWhereClause>
  messageIdNotEqualTo(String messageId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'messageId',
                lower: [],
                upper: [messageId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'messageId',
                lower: [messageId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'messageId',
                lower: [messageId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'messageId',
                lower: [],
                upper: [messageId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterWhereClause>
  chatPartnerIdEqualTo(String chatPartnerId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'chatPartnerId',
          value: [chatPartnerId],
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterWhereClause>
  chatPartnerIdNotEqualTo(String chatPartnerId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'chatPartnerId',
                lower: [],
                upper: [chatPartnerId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'chatPartnerId',
                lower: [chatPartnerId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'chatPartnerId',
                lower: [chatPartnerId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'chatPartnerId',
                lower: [],
                upper: [chatPartnerId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterWhereClause>
  timestampEqualTo(DateTime timestamp) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'timestamp', value: [timestamp]),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterWhereClause>
  timestampNotEqualTo(DateTime timestamp) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'timestamp',
                lower: [],
                upper: [timestamp],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'timestamp',
                lower: [timestamp],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'timestamp',
                lower: [timestamp],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'timestamp',
                lower: [],
                upper: [timestamp],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterWhereClause>
  timestampGreaterThan(DateTime timestamp, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'timestamp',
          lower: [timestamp],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterWhereClause>
  timestampLessThan(DateTime timestamp, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'timestamp',
          lower: [],
          upper: [timestamp],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterWhereClause>
  timestampBetween(
    DateTime lowerTimestamp,
    DateTime upperTimestamp, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'timestamp',
          lower: [lowerTimestamp],
          includeLower: includeLower,
          upper: [upperTimestamp],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterWhereClause>
  ttlEqualTo(DateTime ttl) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'ttl', value: [ttl]),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterWhereClause>
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

  QueryBuilder<MessageCollection, MessageCollection, QAfterWhereClause>
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

  QueryBuilder<MessageCollection, MessageCollection, QAfterWhereClause>
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

  QueryBuilder<MessageCollection, MessageCollection, QAfterWhereClause>
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

extension MessageCollectionQueryFilter
    on QueryBuilder<MessageCollection, MessageCollection, QFilterCondition> {
  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  chatPartnerIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'chatPartnerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  chatPartnerIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'chatPartnerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  chatPartnerIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'chatPartnerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  chatPartnerIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'chatPartnerId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  chatPartnerIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'chatPartnerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  chatPartnerIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'chatPartnerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  chatPartnerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'chatPartnerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  chatPartnerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'chatPartnerId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  chatPartnerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'chatPartnerId', value: ''),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  chatPartnerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'chatPartnerId', value: ''),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  contentEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'content',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  contentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'content',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  contentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'content',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  contentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'content',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  contentStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'content',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  contentEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'content',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  contentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'content',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  contentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'content',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  contentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'content', value: ''),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  contentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'content', value: ''),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
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

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
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

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
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

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  isDirectEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isDirect', value: value),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  messageIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'messageId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  messageIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'messageId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  messageIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'messageId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  messageIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'messageId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  messageIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'messageId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  messageIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'messageId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  messageIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'messageId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  messageIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'messageId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  messageIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'messageId', value: ''),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  messageIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'messageId', value: ''),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
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

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
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

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
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

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
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

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
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

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
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

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
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

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
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

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  recipientIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'recipientId', value: ''),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  recipientIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'recipientId', value: ''),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  senderIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'senderId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  senderIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'senderId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  senderIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'senderId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  senderIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'senderId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  senderIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'senderId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  senderIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'senderId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  senderIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'senderId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  senderIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'senderId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  senderIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'senderId', value: ''),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  senderIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'senderId', value: ''),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  statusEqualTo(MessageStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: value),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  statusGreaterThan(MessageStatus value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'status',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  statusLessThan(MessageStatus value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'status',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  statusBetween(
    MessageStatus lower,
    MessageStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'status',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  timestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'timestamp', value: value),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  timestampGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'timestamp',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  timestampLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'timestamp',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  timestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'timestamp',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
  ttlEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'ttl', value: value),
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
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

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
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

  QueryBuilder<MessageCollection, MessageCollection, QAfterFilterCondition>
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

extension MessageCollectionQueryObject
    on QueryBuilder<MessageCollection, MessageCollection, QFilterCondition> {}

extension MessageCollectionQueryLinks
    on QueryBuilder<MessageCollection, MessageCollection, QFilterCondition> {}

extension MessageCollectionQuerySortBy
    on QueryBuilder<MessageCollection, MessageCollection, QSortBy> {
  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  sortByChatPartnerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatPartnerId', Sort.asc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  sortByChatPartnerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatPartnerId', Sort.desc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  sortByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  sortByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  sortByIsDirect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirect', Sort.asc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  sortByIsDirectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirect', Sort.desc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  sortByMessageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'messageId', Sort.asc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  sortByMessageIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'messageId', Sort.desc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  sortByRecipientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recipientId', Sort.asc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  sortByRecipientIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recipientId', Sort.desc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  sortBySenderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderId', Sort.asc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  sortBySenderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderId', Sort.desc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy> sortByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.asc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  sortByTtlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.desc);
    });
  }
}

extension MessageCollectionQuerySortThenBy
    on QueryBuilder<MessageCollection, MessageCollection, QSortThenBy> {
  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  thenByChatPartnerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatPartnerId', Sort.asc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  thenByChatPartnerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatPartnerId', Sort.desc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  thenByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  thenByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  thenByIsDirect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirect', Sort.asc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  thenByIsDirectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDirect', Sort.desc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  thenByMessageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'messageId', Sort.asc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  thenByMessageIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'messageId', Sort.desc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  thenByRecipientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recipientId', Sort.asc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  thenByRecipientIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recipientId', Sort.desc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  thenBySenderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderId', Sort.asc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  thenBySenderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderId', Sort.desc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy> thenByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.asc);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QAfterSortBy>
  thenByTtlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.desc);
    });
  }
}

extension MessageCollectionQueryWhereDistinct
    on QueryBuilder<MessageCollection, MessageCollection, QDistinct> {
  QueryBuilder<MessageCollection, MessageCollection, QDistinct>
  distinctByChatPartnerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'chatPartnerId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QDistinct>
  distinctByContent({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'content', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QDistinct>
  distinctByIsDirect() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDirect');
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QDistinct>
  distinctByMessageId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'messageId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QDistinct>
  distinctByRecipientId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recipientId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QDistinct>
  distinctBySenderId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'senderId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QDistinct>
  distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QDistinct>
  distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }

  QueryBuilder<MessageCollection, MessageCollection, QDistinct>
  distinctByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ttl');
    });
  }
}

extension MessageCollectionQueryProperty
    on QueryBuilder<MessageCollection, MessageCollection, QQueryProperty> {
  QueryBuilder<MessageCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MessageCollection, String, QQueryOperations>
  chatPartnerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chatPartnerId');
    });
  }

  QueryBuilder<MessageCollection, String, QQueryOperations> contentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'content');
    });
  }

  QueryBuilder<MessageCollection, bool, QQueryOperations> isDirectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDirect');
    });
  }

  QueryBuilder<MessageCollection, String, QQueryOperations>
  messageIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'messageId');
    });
  }

  QueryBuilder<MessageCollection, String, QQueryOperations>
  recipientIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recipientId');
    });
  }

  QueryBuilder<MessageCollection, String, QQueryOperations> senderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'senderId');
    });
  }

  QueryBuilder<MessageCollection, MessageStatus, QQueryOperations>
  statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<MessageCollection, DateTime, QQueryOperations>
  timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }

  QueryBuilder<MessageCollection, DateTime, QQueryOperations> ttlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ttl');
    });
  }
}

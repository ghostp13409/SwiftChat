// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProfileCollectionCollection on Isar {
  IsarCollection<ProfileCollection> get profileCollections => this.collection();
}

const ProfileCollectionSchema = CollectionSchema(
  name: r'ProfileCollection',
  id: -6968070136066212965,
  properties: {
    r'bio': PropertySchema(id: 0, name: r'bio', type: IsarType.string),
    r'isMe': PropertySchema(id: 1, name: r'isMe', type: IsarType.bool),
    r'peerId': PropertySchema(id: 2, name: r'peerId', type: IsarType.string),
    r'photoPath': PropertySchema(
      id: 3,
      name: r'photoPath',
      type: IsarType.string,
    ),
    r'publicKey': PropertySchema(
      id: 4,
      name: r'publicKey',
      type: IsarType.string,
    ),
    r'topics': PropertySchema(
      id: 5,
      name: r'topics',
      type: IsarType.stringList,
    ),
    r'username': PropertySchema(
      id: 6,
      name: r'username',
      type: IsarType.string,
    ),
  },

  estimateSize: _profileCollectionEstimateSize,
  serialize: _profileCollectionSerialize,
  deserialize: _profileCollectionDeserialize,
  deserializeProp: _profileCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'peerId': IndexSchema(
      id: -9089303509033685807,
      name: r'peerId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'peerId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _profileCollectionGetId,
  getLinks: _profileCollectionGetLinks,
  attach: _profileCollectionAttach,
  version: '3.3.2',
);

int _profileCollectionEstimateSize(
  ProfileCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.bio;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.peerId.length * 3;
  {
    final value = object.photoPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.publicKey.length * 3;
  bytesCount += 3 + object.topics.length * 3;
  {
    for (var i = 0; i < object.topics.length; i++) {
      final value = object.topics[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.username.length * 3;
  return bytesCount;
}

void _profileCollectionSerialize(
  ProfileCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bio);
  writer.writeBool(offsets[1], object.isMe);
  writer.writeString(offsets[2], object.peerId);
  writer.writeString(offsets[3], object.photoPath);
  writer.writeString(offsets[4], object.publicKey);
  writer.writeStringList(offsets[5], object.topics);
  writer.writeString(offsets[6], object.username);
}

ProfileCollection _profileCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProfileCollection();
  object.bio = reader.readStringOrNull(offsets[0]);
  object.id = id;
  object.isMe = reader.readBool(offsets[1]);
  object.peerId = reader.readString(offsets[2]);
  object.photoPath = reader.readStringOrNull(offsets[3]);
  object.publicKey = reader.readString(offsets[4]);
  object.topics = reader.readStringList(offsets[5]) ?? [];
  object.username = reader.readString(offsets[6]);
  return object;
}

P _profileCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringList(offset) ?? []) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _profileCollectionGetId(ProfileCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _profileCollectionGetLinks(
  ProfileCollection object,
) {
  return [];
}

void _profileCollectionAttach(
  IsarCollection<dynamic> col,
  Id id,
  ProfileCollection object,
) {
  object.id = id;
}

extension ProfileCollectionByIndex on IsarCollection<ProfileCollection> {
  Future<ProfileCollection?> getByPeerId(String peerId) {
    return getByIndex(r'peerId', [peerId]);
  }

  ProfileCollection? getByPeerIdSync(String peerId) {
    return getByIndexSync(r'peerId', [peerId]);
  }

  Future<bool> deleteByPeerId(String peerId) {
    return deleteByIndex(r'peerId', [peerId]);
  }

  bool deleteByPeerIdSync(String peerId) {
    return deleteByIndexSync(r'peerId', [peerId]);
  }

  Future<List<ProfileCollection?>> getAllByPeerId(List<String> peerIdValues) {
    final values = peerIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'peerId', values);
  }

  List<ProfileCollection?> getAllByPeerIdSync(List<String> peerIdValues) {
    final values = peerIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'peerId', values);
  }

  Future<int> deleteAllByPeerId(List<String> peerIdValues) {
    final values = peerIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'peerId', values);
  }

  int deleteAllByPeerIdSync(List<String> peerIdValues) {
    final values = peerIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'peerId', values);
  }

  Future<Id> putByPeerId(ProfileCollection object) {
    return putByIndex(r'peerId', object);
  }

  Id putByPeerIdSync(ProfileCollection object, {bool saveLinks = true}) {
    return putByIndexSync(r'peerId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPeerId(List<ProfileCollection> objects) {
    return putAllByIndex(r'peerId', objects);
  }

  List<Id> putAllByPeerIdSync(
    List<ProfileCollection> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'peerId', objects, saveLinks: saveLinks);
  }
}

extension ProfileCollectionQueryWhereSort
    on QueryBuilder<ProfileCollection, ProfileCollection, QWhere> {
  QueryBuilder<ProfileCollection, ProfileCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProfileCollectionQueryWhere
    on QueryBuilder<ProfileCollection, ProfileCollection, QWhereClause> {
  QueryBuilder<ProfileCollection, ProfileCollection, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterWhereClause>
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

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterWhereClause>
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

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterWhereClause>
  peerIdEqualTo(String peerId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'peerId', value: [peerId]),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterWhereClause>
  peerIdNotEqualTo(String peerId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'peerId',
                lower: [],
                upper: [peerId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'peerId',
                lower: [peerId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'peerId',
                lower: [peerId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'peerId',
                lower: [],
                upper: [peerId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension ProfileCollectionQueryFilter
    on QueryBuilder<ProfileCollection, ProfileCollection, QFilterCondition> {
  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  bioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'bio'),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  bioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'bio'),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  bioEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'bio',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  bioGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'bio',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  bioLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'bio',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  bioBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'bio',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  bioStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'bio',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  bioEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'bio',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  bioContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'bio',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  bioMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'bio',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  bioIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'bio', value: ''),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  bioIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'bio', value: ''),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
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

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
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

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
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

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  isMeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isMe', value: value),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  peerIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'peerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  peerIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'peerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  peerIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'peerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  peerIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'peerId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  peerIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'peerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  peerIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'peerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  peerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'peerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  peerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'peerId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  peerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'peerId', value: ''),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  peerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'peerId', value: ''),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  photoPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'photoPath'),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  photoPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'photoPath'),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  photoPathEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'photoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  photoPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'photoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  photoPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'photoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  photoPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'photoPath',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  photoPathStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'photoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  photoPathEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'photoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  photoPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'photoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  photoPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'photoPath',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  photoPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'photoPath', value: ''),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  photoPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'photoPath', value: ''),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  publicKeyEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'publicKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  publicKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'publicKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  publicKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'publicKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  publicKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'publicKey',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  publicKeyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'publicKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  publicKeyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'publicKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  publicKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'publicKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  publicKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'publicKey',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  publicKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'publicKey', value: ''),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  publicKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'publicKey', value: ''),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  topicsElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'topics',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  topicsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'topics',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  topicsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'topics',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  topicsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'topics',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  topicsElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'topics',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  topicsElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'topics',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  topicsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'topics',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  topicsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'topics',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  topicsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'topics', value: ''),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  topicsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'topics', value: ''),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  topicsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'topics', length, true, length, true);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  topicsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'topics', 0, true, 0, true);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  topicsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'topics', 0, false, 999999, true);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  topicsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'topics', 0, true, length, include);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  topicsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'topics', length, include, 999999, true);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  topicsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'topics',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  usernameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'username',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  usernameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'username',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  usernameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'username',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  usernameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'username',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  usernameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'username',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  usernameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'username',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  usernameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'username',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  usernameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'username',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  usernameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'username', value: ''),
      );
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterFilterCondition>
  usernameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'username', value: ''),
      );
    });
  }
}

extension ProfileCollectionQueryObject
    on QueryBuilder<ProfileCollection, ProfileCollection, QFilterCondition> {}

extension ProfileCollectionQueryLinks
    on QueryBuilder<ProfileCollection, ProfileCollection, QFilterCondition> {}

extension ProfileCollectionQuerySortBy
    on QueryBuilder<ProfileCollection, ProfileCollection, QSortBy> {
  QueryBuilder<ProfileCollection, ProfileCollection, QAfterSortBy> sortByBio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bio', Sort.asc);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterSortBy>
  sortByBioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bio', Sort.desc);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterSortBy>
  sortByIsMe() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMe', Sort.asc);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterSortBy>
  sortByIsMeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMe', Sort.desc);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterSortBy>
  sortByPeerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'peerId', Sort.asc);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterSortBy>
  sortByPeerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'peerId', Sort.desc);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterSortBy>
  sortByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterSortBy>
  sortByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterSortBy>
  sortByPublicKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicKey', Sort.asc);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterSortBy>
  sortByPublicKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicKey', Sort.desc);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterSortBy>
  sortByUsername() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.asc);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterSortBy>
  sortByUsernameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.desc);
    });
  }
}

extension ProfileCollectionQuerySortThenBy
    on QueryBuilder<ProfileCollection, ProfileCollection, QSortThenBy> {
  QueryBuilder<ProfileCollection, ProfileCollection, QAfterSortBy> thenByBio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bio', Sort.asc);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterSortBy>
  thenByBioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bio', Sort.desc);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterSortBy>
  thenByIsMe() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMe', Sort.asc);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterSortBy>
  thenByIsMeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMe', Sort.desc);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterSortBy>
  thenByPeerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'peerId', Sort.asc);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterSortBy>
  thenByPeerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'peerId', Sort.desc);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterSortBy>
  thenByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterSortBy>
  thenByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterSortBy>
  thenByPublicKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicKey', Sort.asc);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterSortBy>
  thenByPublicKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicKey', Sort.desc);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterSortBy>
  thenByUsername() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.asc);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QAfterSortBy>
  thenByUsernameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.desc);
    });
  }
}

extension ProfileCollectionQueryWhereDistinct
    on QueryBuilder<ProfileCollection, ProfileCollection, QDistinct> {
  QueryBuilder<ProfileCollection, ProfileCollection, QDistinct> distinctByBio({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bio', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QDistinct>
  distinctByIsMe() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isMe');
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QDistinct>
  distinctByPeerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'peerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QDistinct>
  distinctByPhotoPath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QDistinct>
  distinctByPublicKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publicKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QDistinct>
  distinctByTopics() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'topics');
    });
  }

  QueryBuilder<ProfileCollection, ProfileCollection, QDistinct>
  distinctByUsername({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'username', caseSensitive: caseSensitive);
    });
  }
}

extension ProfileCollectionQueryProperty
    on QueryBuilder<ProfileCollection, ProfileCollection, QQueryProperty> {
  QueryBuilder<ProfileCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ProfileCollection, String?, QQueryOperations> bioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bio');
    });
  }

  QueryBuilder<ProfileCollection, bool, QQueryOperations> isMeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isMe');
    });
  }

  QueryBuilder<ProfileCollection, String, QQueryOperations> peerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'peerId');
    });
  }

  QueryBuilder<ProfileCollection, String?, QQueryOperations>
  photoPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoPath');
    });
  }

  QueryBuilder<ProfileCollection, String, QQueryOperations>
  publicKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publicKey');
    });
  }

  QueryBuilder<ProfileCollection, List<String>, QQueryOperations>
  topicsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'topics');
    });
  }

  QueryBuilder<ProfileCollection, String, QQueryOperations> usernameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'username');
    });
  }
}

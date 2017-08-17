#!/usr/bin/env python
# -*- coding:utf-8 -*-
import MeCab
 
text = 'これはMeCabを使って形態素解析をするためのテストです。'
tagger = MeCab.Tagger('-Owakati')
result = tagger.parse(text)
print(result)

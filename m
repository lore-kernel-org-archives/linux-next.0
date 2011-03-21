From: =?euc-kr?B?x9S47cHW?= <myungjoo.ham@samsung.com>
Subject: Re: linux-next: build failure after merge of the final tree (mfd tree
 related)
Date: Mon, 21 Mar 2011 08:12:53 +0000 (GMT)
Message-ID: <24090250.39821300695171946.JavaMail.weblogic@epml12>
Reply-To: myungjoo.ham@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=euc-kr
Content-Transfer-Encoding: base64
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:55719 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750826Ab1CUIMz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 Mar 2011 04:12:55 -0400
Received: from epms1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LIE00G2QETH0Q10@mailout4.samsung.com> for
 linux-next@vger.kernel.org; Mon, 21 Mar 2011 17:12:53 +0900 (KST)
Received: from epv6spt2 ("port 41938"@[203.254.225.172])
 by ms1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTP id <0LIE009G6ETGQNE0@ms1.samsung.com>
 for linux-next@vger.kernel.org; Mon, 21 Mar 2011 17:12:53 +0900 (KST)
MIME-version: 1.0
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Samuel Ortiz <sameo@linux.intel.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?euc-kr?Q?=B9=DA=B0=E6=B9=CE?= <kyungmin.park@samsung.com>

PiBTZW5kZXIgOiBTdGVwaGVuIFJvdGh3ZWxsPHNmckBjYW5iLmF1dWcub3JnLmF1Pg0KPiBEYXRl
IDogMjAxMS0wMy0yMSAxMTo1OSAoR01UKzA5OjAwKQ0KPiBUaXRsZSA6IGxpbnV4LW5leHQ6IGJ1
aWxkIGZhaWx1cmUgYWZ0ZXIgbWVyZ2Ugb2YgdGhlIGZpbmFsIHRyZWUgKG1mZCB0cmVlIHJlbGF0
ZWQpDQo+IA0KPiBIaSBTYW0sDQo+IA0KPiBBZnRlciBtZXJnaW5nIHRoZSBmaW5hbCB0cmVlLCB0
b2RheSdzIGxpbnV4LW5leHQgYnVpbGQgKHBvd2VycGMNCj4gYWxseWVzY29uZmlnKSBmYWlsZWQg
bGlrZSB0aGlzOg0KPiANCj4gZHJpdmVycy9tZmQvbWF4ODk5Ny1pcnEuYzoxNzA6IGVycm9yOiB1
bmtub3duIGZpZWxkICdidXNfbG9jaycgc3BlY2lmaWVkIGluIGluaXRpYWxpemVyDQo+IGRyaXZl
cnMvbWZkL21heDg5OTctaXJxLmM6MTcwOiB3YXJuaW5nOiBpbml0aWFsaXphdGlvbiBmcm9tIGlu
Y29tcGF0aWJsZSBwb2ludGVyIHR5cGUNCj4gZHJpdmVycy9tZmQvbWF4ODk5Ny1pcnEuYzoxNzE6
IGVycm9yOiB1bmtub3duIGZpZWxkICdidXNfc3luY191bmxvY2snIHNwZWNpZmllZCBpbiBpbml0
aWFsaXplcg0KPiBkcml2ZXJzL21mZC9tYXg4OTk3LWlycS5jOjE3MTogd2FybmluZzogaW5pdGlh
bGl6YXRpb24gZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRlciB0eXBlDQo+IGRyaXZlcnMvbWZkL21h
eDg5OTctaXJxLmM6MTcyOiBlcnJvcjogdW5rbm93biBmaWVsZCAnbWFzaycgc3BlY2lmaWVkIGlu
IGluaXRpYWxpemVyDQo+IGRyaXZlcnMvbWZkL21heDg5OTctaXJxLmM6MTcyOiB3YXJuaW5nOiBp
bml0aWFsaXphdGlvbiBmcm9tIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUNCj4gZHJpdmVycy9t
ZmQvbWF4ODk5Ny1pcnEuYzoxNzM6IGVycm9yOiB1bmtub3duIGZpZWxkICd1bm1hc2snIHNwZWNp
ZmllZCBpbiBpbml0aWFsaXplcg0KPiBkcml2ZXJzL21mZC9tYXg4OTk3LWlycS5jOjE3Mzogd2Fy
bmluZzogaW5pdGlhbGl6YXRpb24gZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRlciB0eXBlDQo+IA0K
PiBDYXVzZWQgYnkgY29tbWl0IGQ3ZDIxZDM5NGM5ZCAoIm1mZDogQWRkIE1BWDg5OTcvODk2NiBJ
UlEgY29udHJvbCBmZWF0dXJlIikuDQo+IA0KPiBUaGUgcHJlc2VuY2Ugb2YgdGhlc2UgZmllbGRz
IGRlcGVuZHMgb24NCj4gQ09ORklHX0dFTkVSSUNfSEFSRElSUVNfTk9fREVQUkVDQVRFRCBub3Qg
YmVpbmcgc2V0Lg0KPiANCj4gSSBoYXZlIHJldmVydGVkIHRoYXQgY29tbWl0IGZvciB0b2RheS4N
Cg0KSGVsbG8gU3RlcGhlbiwNCg0KSSd2ZSBqdXN0IHN1Ym1pdHRlZCBhIGNvcnJlY3RlZCBwYXRj
aCB0aGF0IHdvcmtzIHdpdGgNCkNPTkZJR19HRU5FUklDX0hBUkRJUlFTX05PX0RFUFJFQ0FURUQg
YmVpbmcgZWl0aGVyIHNldCBvciB1bnNldC4NCkJlY2F1c2UgaXQgYXBwZWFycyB0aGF0IHdlIHN0
aWxsIGhhdmUgdGFyZ2V0cyB3aXRoIGRlcHJlY2F0ZWQgZnVuY3Rpb25zLA0KSSBsZWZ0IHRoZSBk
ZXByZWNhdGVkIGZ1bmN0aW9ucyB3b3JraW5nIGFzIHdlbGwgYXMgdGhlIG5ldyBvbmVzLg0KDQpU
aGFuayB5b3UuDQoNCi0gTXl1bmdKb28uDQo+IC0tIA0KPiBDaGVlcnMsDQo+IFN0ZXBoZW4gUm90
aHdlbGwgICAgICAgICAgICAgICAgICAgIHNmckBjYW5iLmF1dWcub3JnLmF1DQo+IGh0dHA6Ly93
d3cuY2FuYi5hdXVnLm9yZy5hdS9+c2ZyLw0KPiANCj4NCg0KDQogTXl1bmdKb28gSGFtICjH1Ljt
wdYpDQpNb2JpbGUgU29mdHdhcmUgUGxhdGZvcm0gTGFiLA0KRGlnaXRhbCBNZWRpYSBhbmQgQ29t
bXVuaWNhdGlvbnMgKERNQykgQnVzaW5lc3MNClNhbXN1bmcgRWxlY3Ryb25pY3MNCmNlbGw6ICs4
Mi0xMC02NzE0LTI4NTggLyBvZmZpY2U6ICs4Mi0zMS0yNzktODAzMw==

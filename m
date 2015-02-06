From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH 0/2] tracing/tlb/x85: Fix splat of calling RCU trace code
 on offline CPU
Date: Sat, 7 Feb 2015 00:02:47 +0100
Message-ID: <CA+icZUX24Foy_rCbFJct-vLri0vpZZi-Kp3NwUXjGZdiTLGwhQ@mail.gmail.com>
References: <20150206200653.009919583@goodmis.org>
	<CA+icZUVvnOA9O0GMDangTLATPOHU=Do5Kj-fo0bVu5Wfb0TT7Q@mail.gmail.com>
	<20150206213856.GN5418@linux.vnet.ibm.com>
	<CA+icZUWBJ5-0pyreVdTduaOPg8StccZhcu6=vdD_Zny8CCMZDw@mail.gmail.com>
	<20150206173548.48f53ed7@gandalf.local.home>
	<20150206224836.GU5418@linux.vnet.ibm.com>
	<CA+icZUWnT6o5aS+iRV7fLC95PXHjEyK8TDgUyWcG6bZU0yTX9w@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=089e010d8a7647b7d0050e736b18
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:61528 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751246AbbBFXCs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Feb 2015 18:02:48 -0500
In-Reply-To: <CA+icZUWnT6o5aS+iRV7fLC95PXHjEyK8TDgUyWcG6bZU0yTX9w@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul McKenney <paulmck@linux.vnet.ibm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>

--089e010d8a7647b7d0050e736b18
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 6, 2015 at 11:51 PM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> On Fri, Feb 6, 2015 at 11:48 PM, Paul E. McKenney
> <paulmck@linux.vnet.ibm.com> wrote:
>> On Fri, Feb 06, 2015 at 05:35:48PM -0500, Steven Rostedt wrote:
>>> On Fri, 6 Feb 2015 23:13:02 +0100
>>> Sedat Dilek <sedat.dilek@gmail.com> wrote:
>>>
>>>
>>> > OK, so both patches go through Steve's tree.
>>>
>>> The second patch will require acks from those that maintain the files I
>>> touch.
>>
>> Yep, that is required either way.  I will give it an Acked-by in the hope
>> that this helps.  You have another version on the way, or have I lost
>> count?  ;-)
>>
>
> Working on x85 and probably using ed as $EDITOR, it will take some time.
>

Here is proposal for v2 as a diff to the original posted to LKML.

- Sedat -

--089e010d8a7647b7d0050e736b18
Content-Type: text/plain; charset=US-ASCII; name="2-2.diff"
Content-Disposition: attachment; filename="2-2.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_i5u6hamo0

LS0tIDItMi5wYXRjaAkyMDE1LTAyLTA3IDAwOjAwOjE1LjE1MTYyMTE1NCArMDEwMAorKysgMi0y
LXYyLnBhdGNoCTIwMTUtMDItMDYgMjM6NTk6MjIuMTg3NjIwNzE2ICswMTAwCkBAIC0yLDcgKzIs
NyBAQCBGcm9tIHBhdGNod29yayBGcmkgRmViICA2IDIwOjA2OjU1IDIwMTUKIENvbnRlbnQtVHlw
ZTogdGV4dC9wbGFpbjsgY2hhcnNldD0idXRmLTgiCiBNSU1FLVZlcnNpb246IDEuMAogQ29udGVu
dC1UcmFuc2Zlci1FbmNvZGluZzogN2JpdAotU3ViamVjdDogeDg2L3RibC90cmFjZTogRG8gbm90
IHRyYWNlIG9uIENQVSB0aGF0IGlzIG9mZmxpbmUKK1N1YmplY3Q6IHg4Ni90bGIvdHJhY2U6IERv
IG5vdCB0cmFjZSBvbiBDUFUgdGhhdCBpcyBvZmZsaW5lCiBGcm9tOiBTdGV2ZW4gUm9zdGVkdCA8
cm9zdGVkdEBnb29kbWlzLm9yZz4KIFgtUGF0Y2h3b3JrLUlkOiA1Nzk0NzAxCiBNZXNzYWdlLUlk
OiA8MjAxNTAyMDYyMDA4MDAuNjg5NTczNDc2QGdvb2RtaXMub3JnPgpAQCAtNzAsMTEgKzcwLDIx
IEBAIGNvZGUgd2hlbiB0aGUgQ1BVIGlzIG9mZmxpbmUuCiAKIExpbms6IGh0dHA6Ly9sa21sLmtl
cm5lbC5vcmcvci9DQStpY1pVVUdpR0RvTDVOVThSdXhLekZqb0xqRUtSdFVXeD1KQjhCOWEwRVF2
LWVHelFAbWFpbC5nbWFpbC5jb20KIAorTk9URTogVGhpcyBwYXRjaCByZXF1aXJlcyAidHJhY2lu
ZzogQWRkIGNvbmRpdGlvbiBjaGVjayB0byBSQ1UgbG9ja2RlcCBjaGVja3MiLgorCiBSZXBvcnRl
ZC1ieTogU2VkYXQgRGlsZWsgPHNlZGF0LmRpbGVrQGdtYWlsLmNvbT4KK1Rlc3RlZC1ieTogU2Vk
YXQgRGlsZWsgPHNlZGF0LmRpbGVrQGdtYWlsLmNvbT4KIFN1Z2dlc3RlZC1ieTogUGF1bCBFLiBN
Y0tlbm5leSA8cGF1bG1ja0BsaW51eC52bmV0LmlibS5jb20+CitBY2tlZC1ieTogUGF1bCBFLiBN
Y0tlbm5leSA8cGF1bG1ja0BsaW51eC52bmV0LmlibS5jb20+CiBTaWduZWQtb2ZmLWJ5OiBTdGV2
ZW4gUm9zdGVkdCA8cm9zdGVkdEBnb29kbWlzLm9yZz4KIAogLS0tCisKK1sgZGlsZWtzOiB2MjoK
KyAgLSBzL3RibC90bGIgaW4gc3ViamVjdC1saW5lCisgIC0gQWRkIGEgcmVmZXJlbmNlIHRvIGEg
cHJlY29uZGl0aW9uYWwgcGF0Y2ggCisgIC0gQWRkIFBhdWwncyBBY2tlZC1ieSBdCisKIGluY2x1
ZGUvdHJhY2UvZXZlbnRzL3RsYi5oIHwgNCArKystCiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQogCg==
--089e010d8a7647b7d0050e736b18--

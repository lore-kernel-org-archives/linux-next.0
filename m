From: zhou peng <ailvpeng25@gmail.com>
Subject: Re: About ACL for IPC Object
Date: Mon, 25 Jan 2010 23:21:44 +0800
Message-ID: <6fb445941001250721p73795fe2i9196bd3c77dd0fce@mail.gmail.com>
References: <6fb445941001200112o2934f805l4eb4f78000e9527e@mail.gmail.com>
	 <6fb445941001200120m3aa5e944j54a6f645ce82d76f@mail.gmail.com>
	 <4B57C3C3.9010606@schaufler-ca.com>
	 <20100121090510.GA908@infradead.org>
	 <6fb445941001220115y6b99f7b4g306ea23d3202969@mail.gmail.com>
	 <2375c9f91001220202m724e2ee2p2213b81a043ebd33@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <2375c9f91001220202m724e2ee2p2213b81a043ebd33@mail.gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Am=E9rico_Wang?= <xiyou.wangcong@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Casey Schaufler <casey@schaufler-ca.com>, sds@tycho.nsa.gov, jra@samba.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

I have tested posix sem,posix shm and posix msg queue for ACL on
fedora 12 with kernel 2.6.32.

Posix sem and posix shm using tmpfs monted by default support ACL well =
=2E
Posix msg queue use mqueue fs mounted by manual but it seem not
surpoort ACL well. It failed for setting named ACL item:
{
 $ mkdir /dev/mqueue
 $ mount -o rw, acl -t mqueue none /dev/mqueue
 $cd /dev/mqueue
 "/mq" msg queue object created and used by processes properly

 $getfacl mq
   #file: mq
   #owner:root
   #group:root
   user:rw-
   group::---
   other::---

 $setfacl -m u:testuser:rw mq                                   /* fail=
ed here*/
 $setfacl: mq :Operation not supported
 but mqueue fs works well for setting owner user and owner group items.
}

I am not sure whether mqueue don't support acl or I make mistake.

2010/1/22 Am=E9rico Wang <xiyou.wangcong@gmail.com>:
> (Top-posting fixed.)
>
> On Fri, Jan 22, 2010 at 5:15 PM, zhou peng <ailvpeng25@gmail.com> wro=
te:
>>
>> 2010/1/21 Christoph Hellwig <hch@infradead.org>:
>>> On Wed, Jan 20, 2010 at 07:02:27PM -0800, Casey Schaufler wrote:
>>>> zhou peng wrote:
>>>> > Hi all,
>>>> >
>>>> > There are ACL in file system, but why there are no ACL implement=
ation
>>>> > in IPC object, eg. shm, message queue, FIFO?
>>>> >
>>>>
>>>> Most people haven't noticed that IPC objects are even there, much =
less
>>>> that they have mode bits and not ACLs. Even when we were doing sec=
urity
>>>> evaluations on Unix boxes in the 1990's they were considered insuf=
ficiently
>>>> interesting to justify the additional work to do ACLs.
>>>>
>>>> If you really want ACLs on IPC objects it would make a dandy littl=
e
>>>> project for a summer. I would be happy to review patches.
>>
>> Thanks. It's interesting to add ACL over IPC objects. I want to have=
 a try.
>>
>>>
>>> Or use the posix IPC mechanisms. =A0The Posix shared memory has ACL=
 by
>>> using tmpfs as the backing store, and we could add similar support =
to
>>> Posix messages queues as they are also backed by a normal filesyste=
m.
>>
>> Christoph Hellwig, This way may be convinent. Could you give some
>> detailed message. :)
>> I only find /proc/ipc/shm file which contain the info of shm objs,an=
d
>> tmpfs on /dev/shm which is empty.
>>
>>>
>>> Adding this support to the old SYSV IPC mechanisms would be much ha=
rder
>>> as they do not fit into the file backed model we use everywhere els=
e at
>>> all.
>>
>> Just like file objects, the mode bits are implment over IPC objects
>> without file backed, so I think adding ACL support to IPC objects ma=
y
>> be somewhat reasonable :)
>>
>> Thank you all for so many solutions.
>>
>> I want to control some IPC object (shm, msg queue, semphore) can be
>> accessed by which named user or named group just like file objects A=
CL
>> do.
>>
>> I studied the solution you all referred, The SELinux is powerful but
>> may be somewhat complicated. And I am confused with Christoph
>> Hellwig=91s solution using tmpfs.
>
> Well, only posix semphores and posix share memory use tmpfs, I think,
> posix msg queues use "mqueue" instead.
>



--=20
zhoupeng
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

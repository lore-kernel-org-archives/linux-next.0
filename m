From: =?UTF-8?Q?Am=C3=A9rico_Wang?= <xiyou.wangcong@gmail.com>
Subject: Re: About ACL for IPC Object
Date: Fri, 22 Jan 2010 18:02:47 +0800
Message-ID: <2375c9f91001220202m724e2ee2p2213b81a043ebd33@mail.gmail.com>
References: <6fb445941001200112o2934f805l4eb4f78000e9527e@mail.gmail.com>
	 <6fb445941001200120m3aa5e944j54a6f645ce82d76f@mail.gmail.com>
	 <4B57C3C3.9010606@schaufler-ca.com>
	 <20100121090510.GA908@infradead.org>
	 <6fb445941001220115y6b99f7b4g306ea23d3202969@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <6fb445941001220115y6b99f7b4g306ea23d3202969@mail.gmail.com>
Sender: linux-security-module-owner@vger.kernel.org
To: zhou peng <ailvpeng25@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Casey Schaufler <casey@schaufler-ca.com>, sds@tycho.nsa.gov, jra@samba.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

(Top-posting fixed.)

On Fri, Jan 22, 2010 at 5:15 PM, zhou peng <ailvpeng25@gmail.com> wrote=
:
>
> 2010/1/21 Christoph Hellwig <hch@infradead.org>:
>> On Wed, Jan 20, 2010 at 07:02:27PM -0800, Casey Schaufler wrote:
>>> zhou peng wrote:
>>> > Hi all,
>>> >
>>> > There are ACL in file system, but why there are no ACL implementa=
tion
>>> > in IPC object, eg. shm, message queue, FIFO?
>>> >
>>>
>>> Most people haven't noticed that IPC objects are even there, much l=
ess
>>> that they have mode bits and not ACLs. Even when we were doing secu=
rity
>>> evaluations on Unix boxes in the 1990's they were considered insuff=
iciently
>>> interesting to justify the additional work to do ACLs.
>>>
>>> If you really want ACLs on IPC objects it would make a dandy little
>>> project for a summer. I would be happy to review patches.
>
> Thanks. It's interesting to add ACL over IPC objects. I want to have =
a try.
>
>>
>> Or use the posix IPC mechanisms. =C2=A0The Posix shared memory has A=
CL by
>> using tmpfs as the backing store, and we could add similar support t=
o
>> Posix messages queues as they are also backed by a normal filesystem=
=2E
>
> Christoph Hellwig, This way may be convinent. Could you give some
> detailed message. :)
> I only find /proc/ipc/shm file which contain the info of shm objs,and
> tmpfs on /dev/shm which is empty.
>
>>
>> Adding this support to the old SYSV IPC mechanisms would be much har=
der
>> as they do not fit into the file backed model we use everywhere else=
 at
>> all.
>
> Just like file objects, the mode bits are implment over IPC objects
> without file backed, so I think adding ACL support to IPC objects may
> be somewhat reasonable :)
>
> Thank you all for so many solutions.
>
> I want to control some IPC object (shm, msg queue, semphore) can be
> accessed by which named user or named group just like file objects AC=
L
> do.
>
> I studied the solution you all referred, The SELinux is powerful but
> may be somewhat complicated. And I am confused with Christoph
> Hellwig=E2=80=98s solution using tmpfs.

Well, only posix semphores and posix share memory use tmpfs, I think,
posix msg queues use "mqueue" instead.
--
To unsubscribe from this list: send the line "unsubscribe linux-securit=
y-module" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

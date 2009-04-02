From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: next-20090310: ext4 hangs
Date: Thu, 2 Apr 2009 22:50:59 +0400
Message-ID: <a4423d670904021150p5fcd1f82wefa68c839b2869a1@mail.gmail.com>
References: <20090325151516.GB14881@atrey.karlin.mff.cuni.cz>
	 <20090325152234.GN23439@duck.suse.cz>
	 <a4423d670903250829w5e9304a7rce24f4220379620f@mail.gmail.com>
	 <20090325161556.GP23439@duck.suse.cz>
	 <a4423d670903251007r72058ca8m28275c1433ab2706@mail.gmail.com>
	 <20090325194316.GQ23439@duck.suse.cz>
	 <a4423d670903251538p3a7c180br1bcfe08c4f044c15@mail.gmail.com>
	 <20090331100150.GF11808@duck.suse.cz>
	 <a4423d670903310307i7acd31f0r4836beae14cfb92d@mail.gmail.com>
	 <20090331123307.GG11808@duck.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-ext4-owner@vger.kernel.org>
In-Reply-To: <20090331123307.GG11808@duck.suse.cz>
Sender: linux-ext4-owner@vger.kernel.org
To: Jan Kara <jack@suse.cz>
Cc: Theodore Tso <tytso@mit.edu>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, linux-ext4@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, sparclinux@vger.kernel.org
List-Id: linux-next.vger.kernel.org

>> > =C2=A0I'm helpless here. I don't see how we can miss a wakeup (plu=
s you seem to
>> > be the only one reporting the bug). Could you please compile and t=
est the kernel
>> > with the attached patch? It will print to kernel log when we go to=
 sleep
>> > waiting for inode commit and when we send wakeups etc. When you hi=
t the
>> > deadlock, please send me your kernel log. It should help with debu=
gging why do
>> > we miss the wakeup. Thanks.
>>
>> Which patch?
> =C2=A0Ups. Forgot to attach ;).

Cannot reproduce it on current 2.6.29-git. Strange.
It should already have all ext4/jbd2 patches from next-20090310,
but anyway it happened with 2.6.29-rc8 also.
I ran dbench in cycle on two indentical hosts for more than 24 hours
with no hang tasks.

I will try 2.6.29.
--
To unsubscribe from this list: send the line "unsubscribe linux-ext4" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

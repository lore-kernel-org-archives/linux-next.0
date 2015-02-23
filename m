From: Olof Johansson <olof@lixom.net>
Subject: Re: Linux 4.0-rc1 out..
Date: Mon, 23 Feb 2015 15:14:30 -0800
Message-ID: <CAOesGMhPfQco-4M71eTz49fmVOMMJLYaAX0rRHhD9L4bucDCdQ@mail.gmail.com>
References: <CA+55aFzS==STcTbwabdvw=7_xX08kkUd=g2Q4XbWJzKbpjyN1A@mail.gmail.com>
	<20150223161541.22df98cc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150223161541.22df98cc@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi,

On Sun, Feb 22, 2015 at 9:15 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> There are also 265 commits in next-20150209 that didn't make it into
> v4.0-rc1.
>
> Top ten first word of commit summary:
>
>      25 rcu
>      24 arm
>      20 selftests
>      19 mm
>      11 arm-soc
>       6 documentation
>       5 tracing
>       5 staging
>       5 libceph
>       5 ceph
>
> Top ten authors:
>
>      36 akpm@linux-foundation.org
>      34 paulmck@linux.vnet.ibm.com
>      20 shuahkh@osg.samsung.com
>      11 olof@lixom.net

This is expected. We keep a next-only index file of what merges we've
done in arch/arm/arm-soc-for-next-contents.txt which accounts for
these commits.


-Olof

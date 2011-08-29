From: Cong Wang <amwang@redhat.com>
Subject: Re: [Patch] numa: introduce CONFIG_NUMA_SYSFS for drivers/base/node.c
Date: Mon, 29 Aug 2011 10:29:29 +0800
Message-ID: <4E5AF989.106@redhat.com>
References: <20110804145834.3b1d92a9eeb8357deb84bf83@canb.auug.org.au> <20110804152211.ea10e3e7.rdunlap@xenotime.net> <20110823143912.0691d442.akpm@linux-foundation.org> <4E547155.8090709@redhat.com> <20110824191430.8a908e70.rdunlap@xenotime.net> <4E55C221.8080100@redhat.com> <20110824205044.7ff45b6c.rdunlap@xenotime.net> <alpine.DEB.2.00.1108242202050.576@chino.kir.corp.google.com> <4E562248.2090102@redhat.com> <alpine.DEB.2.00.1108251356220.18747@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <alpine.DEB.2.00.1108251356220.18747@chino.kir.corp.google.com>
Sender: owner-linux-mm@kvack.org
To: David Rientjes <rientjes@google.com>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org
List-Id: linux-next.vger.kernel.org

=E4=BA=8E 2011=E5=B9=B408=E6=9C=8826=E6=97=A5 04:57, David Rientjes =E5=86=
=99=E9=81=93:
> On Thu, 25 Aug 2011, Cong Wang wrote:
>
>>> No, it doesn't work, CONFIG_HUGETLBFS can be enabled with CONFIG_NUMA=
=3Dy
>>> and CONFIG_SYSFS=3Dn and that uses data structures from drivers/base/=
node.c
>>> which doesn't get compiled with this patch.
>>
>> So, you mean with CONFIG_NUMA=3Dy&&  CONFIG_SYSFS=3Dn&&  CONFIG_HUGETL=
BFS=3Dy
>> we still get compile error?
>>
>> Which data structures are used by hugetlbfs?
>>
>
> node_states[], which is revealed at link time if you tried to compile y=
our
> patch.  It's obvious that we don't want to add per-node hugetlbfs
> attributes to sysfs directories if sysfs is disabled, so you need to
> modify the hugetlbfs code as well.

Makes sense. Thanks!

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Fight unfair telecom internet charges in Canada: sign http://stopthemeter=
.ca/
Don't email: <a href=3Dmailto:"dont@kvack.org"> email@kvack.org </a>

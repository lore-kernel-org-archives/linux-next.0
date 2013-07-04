From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Jul 4
Date: Thu, 4 Jul 2013 10:21:09 +0200
Message-ID: <CA+icZUV8Nw2eY7aJg0qSCmg+Pk_EdRT2joUqxiL8y77rUsBGHg@mail.gmail.com>
References: <20130704160652.4f76f0ee43877a6e726d6c8b@canb.auug.org.au>
	<CA+icZUXchb2H=ZZ0Zv+vA43x0CNVSbLvPptawnBR+OUpOzqP6A@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-we0-f178.google.com ([74.125.82.178]:48921 "EHLO
	mail-we0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932990Ab3GDIVK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Jul 2013 04:21:10 -0400
In-Reply-To: <CA+icZUXchb2H=ZZ0Zv+vA43x0CNVSbLvPptawnBR+OUpOzqP6A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Thu, Jul 4, 2013 at 9:41 AM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> On Thu, Jul 4, 2013 at 8:06 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi all,
>>
>> Changes since 20130703:
>>
>> The net-next tree lost its build failure.
>>
>> The akpm tree gained a conflict against the kbuild tree and lost lots of
>> patches that turned up elsewhere.
>>
>> ----------------------------------------------------------------------------
>>
>
> Just FYI:
> People building with "CONFIG_MEMCG_KMEM=n" (still) need an extra patch
> pending in mmots-tree [1].
> ( Unfortunately, it does not cleanly apply against next-20130704. )
>

I have compared both mm/memcontrol.c files from
next-20130703/next-20130704 - they are identical.

These hunks...

[ From Li Zefan ]
@@ -6332,8 +6341,7 @@ static void mem_cgroup_css_free(struct cgroup *cont)
 {
        struct mem_cgroup *memcg = mem_cgroup_from_cont(cont);

-       mem_cgroup_sockets_destroy(memcg);
-
+       memcg_destroy_kmem(memcg);
        __mem_cgroup_free(memcg);
 }

[ From mmots ]
@@ -6399,8 +6408,7 @@ static void mem_cgroup_css_free(struct c
 {
        struct mem_cgroup *memcg = mem_cgroup_from_cont(cont);

-       mem_cgroup_sockets_destroy(memcg);
-
+       memcg_destroy_kmem(memcg);
        mem_cgroup_put(memcg);
 }

...seems to differ.

In both mentioned -next releases there exist no mem_cgroup_put() in
mm/memcontrol.c.
So the hunk in mmots seems to be wrong in my eyes.

Andrew? ^^^

- Sedat -

> - Sedat -
>
> [1] http://ozlabs.org/~akpm/mmots/broken-out/memcg-use-css_get-put-when-charging-uncharging-kmem-fix-fix.patch

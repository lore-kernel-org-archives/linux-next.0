From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Jul 4
Date: Thu, 4 Jul 2013 11:12:43 +0200
Message-ID: <CA+icZUW7uQUHp9eVFKvTvdP+W3CLvfiuaPMieWh-81B8n94iqg@mail.gmail.com>
References: <20130704160652.4f76f0ee43877a6e726d6c8b@canb.auug.org.au>
	<CA+icZUXchb2H=ZZ0Zv+vA43x0CNVSbLvPptawnBR+OUpOzqP6A@mail.gmail.com>
	<CA+icZUV8Nw2eY7aJg0qSCmg+Pk_EdRT2joUqxiL8y77rUsBGHg@mail.gmail.com>
	<20130704014544.bce5cdb6.akpm@linux-foundation.org>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:64953 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933532Ab3GDJMq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Jul 2013 05:12:46 -0400
In-Reply-To: <20130704014544.bce5cdb6.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Li Zefan <lizefan@huawei.com>

On Thu, Jul 4, 2013 at 10:45 AM, Andrew Morton
<akpm@linux-foundation.org> wrote:
> On Thu, 4 Jul 2013 10:21:09 +0200 Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
>> I have compared both mm/memcontrol.c files from
>> next-20130703/next-20130704 - they are identical.
>>
>> These hunks...
>>
>> [ From Li Zefan ]
>> @@ -6332,8 +6341,7 @@ static void mem_cgroup_css_free(struct cgroup *cont)
>>  {
>>         struct mem_cgroup *memcg = mem_cgroup_from_cont(cont);
>>
>> -       mem_cgroup_sockets_destroy(memcg);
>> -
>> +       memcg_destroy_kmem(memcg);
>>         __mem_cgroup_free(memcg);
>>  }
>>
>> [ From mmots ]
>> @@ -6399,8 +6408,7 @@ static void mem_cgroup_css_free(struct c
>>  {
>>         struct mem_cgroup *memcg = mem_cgroup_from_cont(cont);
>>
>> -       mem_cgroup_sockets_destroy(memcg);
>> -
>> +       memcg_destroy_kmem(memcg);
>>         mem_cgroup_put(memcg);
>>  }
>>
>> ...seems to differ.
>>
>> In both mentioned -next releases there exist no mem_cgroup_put() in
>> mm/memcontrol.c.
>> So the hunk in mmots seems to be wrong in my eyes.
>
> Seems right - thanks for catching that.
>
> --- a/mm/memcontrol.c~memcg-use-css_get-put-when-charging-uncharging-kmem-fix-fix-fix
> +++ a/mm/memcontrol.c
> @@ -6409,7 +6409,7 @@ static void mem_cgroup_css_free(struct c
>         struct mem_cgroup *memcg = mem_cgroup_from_cont(cont);
>
>         memcg_destroy_kmem(memcg);
> -       mem_cgroup_put(memcg);
> +       __mem_cgroup_free(memcg);
>  }
>
>  #ifdef CONFIG_MMU
> _
>

Hmm, if...

     memcg-use-css_get-put-when-charging-uncharging-kmem-fix-fix.patch

...does not apply here, a follow-up makes not really sense to me...

     memcg-use-css_get-put-when-charging-uncharging-kmem-fix-fix-fix.patch

Maybe, I am wrong seeing it from -next side than -mm.
( Might be you want to keep the chronology. )
Anyway, dunno, will fold that into -fix-fix.

- Sedat

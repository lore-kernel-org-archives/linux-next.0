Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ORvDthmp"
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8E9B10D9;
	Thu, 30 Nov 2023 09:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=SfxaXFs+cllY4uODLdXtYEBXO/hmVXC6iVPj35F0Y6A=; b=ORvDthmpj0fi/bP8z6Pk5T3Gx/
	ghxAZCpj3Otwhp2Y+U5MiC5K6/RazDsjHg+1b3mNiVE+91nK5LJA3unS6fFvrLT6gCpkNwxbyrf5H
	B3WAJeTXU925WWBXUfgRD3Nh0SO3Bau7kyxUITCpvEM8p/IYwFiWyqXK63rRTUN9k7uODi2tCzqXY
	7P1sZ0oo/9zmm9ydQGqzzUvZ13erL3xjb9BIpU/cLFId/RiOtIlgP4bTVeQ5zWyNBx+/KJ9tUcGUS
	UZWLiL/N9j+MZJFzAjUKsz06oVGkNWO3+T1MkoLBLJCmQ643t3pqCMLPoIOOVEjfk5gixBDjxN/Bu
	C99MYjHA==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r8kdl-00BTih-1g;
	Thu, 30 Nov 2023 17:15:53 +0000
Message-ID: <6d11b95a-c5a5-47ca-b3da-d78f2ef9f5bc@infradead.org>
Date: Thu, 30 Nov 2023 09:15:53 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Nov 30 (mm/zswap.c)
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, Seth Jennings <sjenning@redhat.com>,
 Dan Streetman <ddstreet@ieee.org>, Vitaly Wool <vitaly.wool@konsulko.com>
References: <20231130140330.55de96cd@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231130140330.55de96cd@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/29/23 19:03, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20231129:
> 

on i386, loongarch, ppc64, riscv32:
when CONFIG_MEMCG is not set.


../mm/zswap.c: In function 'mem_cgroup_from_entry':
../mm/zswap.c:313:31: error: implicit declaration of function 'obj_cgroup_memcg'; did you mean 'obj_cgroup_put'? [-Werror=implicit-function-declaration]
  313 |         return entry->objcg ? obj_cgroup_memcg(entry->objcg) : NULL;
      |                               ^~~~~~~~~~~~~~~~
      |                               obj_cgroup_put
../mm/zswap.c:313:62: warning: pointer/integer type mismatch in conditional expression
  313 |         return entry->objcg ? obj_cgroup_memcg(entry->objcg) : NULL;
      |                                                              ^
../mm/zswap.c: In function 'shrink_worker':
../mm/zswap.c:984:31: error: invalid use of undefined type 'struct mem_cgroup'
  984 |                 css_get(&memcg->css);
      |                               ^~



-- 
~Randy

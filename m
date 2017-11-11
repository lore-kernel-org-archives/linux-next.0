From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2017-11-10-15-56 uploaded (lib/test_find_bit.c)
Date: Fri, 10 Nov 2017 18:00:57 -0800
Message-ID: <2ce9cf55-2b54-b6cd-fa4d-3cd0a354b5f1@infradead.org>
References: <5a063cc8.w9SFxvjWsZNJM4HP%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <5a063cc8.w9SFxvjWsZNJM4HP%akpm@linux-foundation.org>
Content-Language: en-US
Sender: owner-linux-mm@kvack.org
To: akpm@linux-foundation.org, mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, mhocko@suse.cz, broonie@kernel.org, Yury Norov <ynorov@caviumnetworks.com>
List-Id: linux-next.vger.kernel.org

On 11/10/2017 03:56 PM, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2017-11-10-15-56 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 
> mmotm-readme.txt says
> 
> README for mm-of-the-moment:
> 
> http://www.ozlabs.org/~akpm/mmotm/
> 
> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> more than once a week.

on i386:

../lib/test_find_bit.c:54:2: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'cycles_t' [-Wformat=]
../lib/test_find_bit.c:68:2: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'cycles_t' [-Wformat=]
../lib/test_find_bit.c:82:2: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'cycles_t' [-Wformat=]
../lib/test_find_bit.c:102:2: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'cycles_t' [-Wformat=]



-- 
~Randy

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>

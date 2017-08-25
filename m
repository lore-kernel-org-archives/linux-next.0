From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2017-08-25-15-50 uploaded
Date: Fri, 25 Aug 2017 16:50:26 -0700
Message-ID: <3c9df006-0cc5-3a32-b715-1fbb43cb9ea8@infradead.org>
References: <59a0a9d1.jzOblYrHfdIDuDZw%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <59a0a9d1.jzOblYrHfdIDuDZw%akpm@linux-foundation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, mhocko@suse.cz, broonie@kernel.org
Cc: =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>
List-Id: linux-next.vger.kernel.org

On 08/25/17 15:50, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2017-08-25-15-50 has been uploaded to
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

lots of this one (on x86_64, i386, or UML):

../kernel/fork.c:818:2: error: implicit declaration of function 'hmm_mm_init' [-Werror=implicit-function-declaration]
../kernel/fork.c:897:2: error: implicit declaration of function 'hmm_mm_destroy' [-Werror=implicit-function-declaration]

from mm-hmm-heterogeneous-memory-management-hmm-for-short-v5.patch

Cc: Jérôme Glisse <jglisse@redhat.com>

-- 
~Randy

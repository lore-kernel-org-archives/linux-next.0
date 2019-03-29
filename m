From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2019-03-28-15-50 uploaded (gcov)
Date: Thu, 28 Mar 2019 20:18:49 -0700
Message-ID: <f4705506-676e-d331-2a96-5f6f5b00f604@infradead.org>
References: <20190328225107.ULwYw%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328225107.ULwYw%akpm@linux-foundation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, broonie@kernel.org, mhocko@suse.cz, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org, Greg Hackmann <ghackmann@android.com>
List-Id: linux-next.vger.kernel.org

On 3/28/19 3:51 PM, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2019-03-28-15-50 has been uploaded to
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



when # CONFIG_MODULES is not set:

  CC      kernel/gcov/gcc_4_7.o
../kernel/gcov/gcc_4_7.c: In function ‘gcov_info_within_module’:
../kernel/gcov/gcc_4_7.c:162:2: error: implicit declaration of function ‘within_module’ [-Werror=implicit-function-declaration]
  return within_module((unsigned long)info, mod);
  ^


-- 
~Randy

From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2019-03-05-16-36 uploaded (zstd)
Date: Wed, 6 Mar 2019 16:22:04 -0800
Message-ID: <a02fdae6-1f3c-6725-88e5-73316017f5ac@infradead.org>
References: <20190306003721.eX4wF%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190306003721.eX4wF%akpm@linux-foundation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, broonie@kernel.org, mhocko@suse.cz, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org
Cc: Nick Terrell <terrelln@fb.com>, Chris Mason <clm@fb.com>
List-Id: linux-next.vger.kernel.org

On 3/5/19 4:37 PM, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2019-03-05-16-36 has been uploaded to
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
> 
> You will need quilt to apply these patches to the latest Linus release (5.x
> or 5.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
> http://ozlabs.org/~akpm/mmotm/series
> 
> The file broken-out.tar.gz contains two datestamp files: .DATE and
> .DATE-yyyy-mm-dd-hh-mm-ss.  Both contain the string yyyy-mm-dd-hh-mm-ss,
> followed by the base kernel version against which this patch series is to
> be applied.

on x86_64:

../lib/zstd/decompress.c: In function 'ZSTD_decompressStream':
../lib/zstd/decompress.c:416:2: warning: argument 1 null where non-null expected [-Wnonnull]
  memcpy(dst, src, srcSize);
  ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../arch/x86/include/asm/string.h:5:0,
                 from ../include/linux/string.h:20,
                 from ../lib/zstd/mem.h:24,
                 from ../lib/zstd/bitstream.h:54,
                 from ../lib/zstd/fse.h:228,
                 from ../lib/zstd/decompress.c:32:
../arch/x86/include/asm/string_64.h:14:14: note: in a call to function 'memcpy' declared here
 extern void *memcpy(void *to, const void *from, size_t len);
              ^~~~~~
../lib/zstd/decompress.c:426:2: warning: argument 1 null where non-null expected [-Wnonnull]
  memset(dst, *(const BYTE *)src, regenSize);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../arch/x86/include/asm/string.h:5:0,
                 from ../include/linux/string.h:20,
                 from ../lib/zstd/mem.h:24,
                 from ../lib/zstd/bitstream.h:54,
                 from ../lib/zstd/fse.h:228,
                 from ../lib/zstd/decompress.c:32:
../arch/x86/include/asm/string_64.h:18:7: note: in a call to function 'memset' declared here
 void *memset(void *s, int c, size_t n);
       ^~~~~~



-- 
~Randy

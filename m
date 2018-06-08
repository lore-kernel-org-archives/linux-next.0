From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2018-06-07-16-59 uploaded (fs/fat/ and fs/dax/)
Date: Thu, 7 Jun 2018 17:59:47 -0700
Message-ID: <7d9fbe5c-7865-dfd1-ce7a-7b2ceaa000fa@infradead.org>
References: <20180607235947.xWQtg%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180607235947.xWQtg%akpm@linux-foundation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, broonie@kernel.org, mhocko@suse.cz, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 06/07/2018 04:59 PM, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2018-06-07-16-59 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 

(on i386:)

../fs/fat/inode.c: In function '__fat_get_block':
../fs/fat/inode.c:162:3: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'sector_t' [-Wformat=]
   fat_fs_error(sb,
   ^


../fs/dax.c: In function 'dax_load_hole':
../fs/dax.c:1031:2: error: 'entry2' undeclared (first use in this function)
  entry2 = dax_insert_mapping_entry(mapping, vmf, entry, pfn,
  ^


Easy fixes... :)
-- 
~Randy

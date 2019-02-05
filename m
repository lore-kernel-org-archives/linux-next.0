From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2019-02-04-17-47 uploaded (fs/binfmt_elf.c)
Date: Mon, 4 Feb 2019 20:26:43 -0800
Message-ID: <08a894b1-66f6-19bf-67be-c9b7b1b01126@infradead.org>
References: <20190205014806.rQcAx%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190205014806.rQcAx%akpm@linux-foundation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, broonie@kernel.org, mhocko@suse.cz, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org, Richard Weinberger <richard@nod.at>, Alexey Dobriyan <adobriyan@gmail.com>
List-Id: linux-next.vger.kernel.org

On 2/4/19 5:48 PM, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2019-02-04-17-47 has been uploaded to
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
> You will need quilt to apply these patches to the latest Linus release (4.x
> or 4.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
> http://ozlabs.org/~akpm/mmotm/series

on x86_64 UML: (although should be many places)

../fs/binfmt_elf.c: In function ‘write_note_info’:
../fs/binfmt_elf.c:2122:19: error: ‘tmp’ undeclared (first use in this function)
   for (i = 0; i < tmp->num_notes; i++)
                   ^



-- 
~Randy

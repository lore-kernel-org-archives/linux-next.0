From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2018-01-31-16-51 uploaded (f2fs)
Date: Wed, 31 Jan 2018 18:51:35 -0800
Message-ID: <b764819a-a7d6-6976-bc46-eab972566309@infradead.org>
References: <5a7264b1.mqPv/eshq6wqQFu6%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
In-Reply-To: <5a7264b1.mqPv/eshq6wqQFu6%akpm@linux-foundation.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>,
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>,
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
To: akpm@linux-foundation.org, mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, mhocko@suse.cz, broonie@kernel.org, linux-f2fs-devel@lists.sourceforge.net
List-Id: linux-next.vger.kernel.org

On 01/31/2018 04:52 PM, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2018-01-31-16-51 has been uploaded to
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
> 
> The file broken-out.tar.gz contains two datestamp files: .DATE and
> .DATE-yyyy-mm-dd-hh-mm-ss.  Both contain the string yyyy-mm-dd-hh-mm-ss,
> followed by the base kernel version against which this patch series is to
> be applied.

It looks like this build error is not from an mmotm patch but from mainline
or linux-next:

on i386:
../fs/f2fs/super.c: In function 'f2fs_fill_super':
../fs/f2fs/super.c:2563:18: error: 'SB_I_CGROUPWB' undeclared (first use in this function)
  sb->s_iflags |= SB_I_CGROUPWB;
                  ^

Anyway, it's an unknown value.

-- 
~Randy

------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot

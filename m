From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Aug 16 (lustre)
Date: Fri, 16 Aug 2013 13:33:02 -0700
Message-ID: <520E8C7E.90802@infradead.org>
References: <20130816171634.8cb22a8f67d6dce8669d9899@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20130816171634.8cb22a8f67d6dce8669d9899@canb.auug.org.au>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Peng Tao <tao.peng@emc.com>, linux-next@vger.kernel.org, hpdd-discuss <hpdd-discuss@ml01.01.org>
List-Id: linux-next.vger.kernel.org

On 08/16/13 00:16, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20130815:
> 

lustre needs to depend on PROC_FS or provide stub functions for when
CONFIG_PROC_FS is not enabled, otherwise there are build errors and
warnings:


drivers/staging/lustre/lustre/lmv/lproc_lmv.c: In function 'lprocfs_lmv_init_vars':
drivers/staging/lustre/lustre/lmv/lproc_lmv.c:232:26: error: 'lprocfs_lmv_module_vars' undeclared (first use in this function)
drivers/staging/lustre/lustre/lmv/lproc_lmv.c:232:26: note: each undeclared identifier is reported only once for each function it appears in
drivers/staging/lustre/lustre/lmv/lproc_lmv.c:233:26: error: 'lprocfs_lmv_obd_vars' undeclared (first use in this function)
drivers/staging/lustre/lustre/lmv/lproc_lmv.c: At top level:
drivers/staging/lustre/lustre/lmv/lproc_lmv.c:45:28: warning: 'lprocfs_module_vars' defined but not used [-Wunused-variable]
drivers/staging/lustre/lustre/lmv/lproc_lmv.c:46:28: warning: 'lprocfs_obd_vars' defined but not used [-Wunused-variable]




-- 
~Randy

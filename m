From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] [media] staging: media: Fix build for iMON LIRC driver
Date: Wed, 16 Oct 2013 07:12:13 -0700
Message-ID: <20131016141213.GA17567@kroah.com>
References: <1381845763-10487-1-git-send-email-treding@nvidia.com>
 <1381845763-10487-3-git-send-email-treding@nvidia.com>
 <20131016070340.GC11731@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20131016070340.GC11731@mwanda>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: devel@driverdev.osuosl.org, Thierry Reding <thierry.reding@gmail.com>, linux-next@vger.kernel.org, Archana kumari <archanakumari959@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, Oct 16, 2013 at 10:03:40AM +0300, Dan Carpenter wrote:
> On Tue, Oct 15, 2013 at 04:02:43PM +0200, Thierry Reding wrote:
> > Add a missing , between parameters in a call to dev_info().
> > 
> 
> Greg already reverted the original patch.
> 
> The original patch wasn't sent to the list.  Archana, use
> scripts/get_maintainer.pl to find out who to send patches to.  Don't
> CC the linux-kernel list though because they don't care about details in
> staging.

Archana sent it through the OPW submission process, which has it's own
mailing list, so as to not bother the driverdev mailing list.  It was
my fault that I missed this error and took the patch, which is why I
reverted it.

thanks,

greg k-h

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: randconfig build error with next-20140912, in
 drivers/staging/lustre/lustre/obdclass
Date: Fri, 12 Sep 2014 09:37:28 -0700
Message-ID: <20140912163728.GA27559@kroah.com>
References: <CA+r1ZhiLP+JTnV2w=PgWTHgW6KbcPuactc6Mr9OkSXdERFGMtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <CA+r1ZhiLP+JTnV2w=PgWTHgW6KbcPuactc6Mr9OkSXdERFGMtg@mail.gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Jim Davis <jim.epost@gmail.com>
Cc: devel <devel@driverdev.osuosl.org>, Stephen Rothwell <sfr@canb.auug.org.au>, andreas.dilger@intel.com, linux-kernel <linux-kernel@vger.kernel.org>, oleg.drokin@intel.com, linux-next <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Sep 12, 2014 at 09:25:01AM -0700, Jim Davis wrote:
> Building with the attached random configuration file,
> 
> ERROR: "obd_memory"
> [drivers/staging/lustre/lustre/obdclass/obdclass.ko] undefined!
> make[1]: *** [__modpost] Error 1

You are bit slower than the 0-day bot, the proper developers have
already been notified of this :)

thanks,

greg k-h

From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 ] staging: ft1000: fix else style error
Date: Sat, 17 Jan 2015 15:23:49 -0800
Message-ID: <20150117232349.GA27066@kroah.com>
References: <1421184840-24108-1-git-send-email-bilel.dr@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1421184840-24108-1-git-send-email-bilel.dr@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Bilel DRIRA <bilel.dr@gmail.com>
Cc: devel@driverdev.osuosl.org, tapaswenipathak@gmail.com, linux-kernel@vger.kernel.org, gdonald@gmail.com, linux-next@vger.kernel.org, joe@perches.com
List-Id: linux-next.vger.kernel.org

On Tue, Jan 13, 2015 at 10:34:00PM +0100, Bilel DRIRA wrote:
> This patch fix the checkpatch.pl error:
> 
> 	ERROR: else should follow close brace '}'
> 
> Signed-off-by: Bilel DRIRA <bilel.dr@gmail.com>
> ---
> v2: remove braces instead of just putting else after close brace. (suggested by Joe Perches).
> 
>  drivers/staging/ft1000/ft1000-pcmcia/ft1000_hw.c |   29 ++++++++--------------
>  1 file changed, 10 insertions(+), 19 deletions(-)

Doesn't apply to my tree due to changes from other developers before you
in this area, sorry.

greg k-h

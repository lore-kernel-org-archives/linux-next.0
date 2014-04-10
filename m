From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2] staging: comedi: declare das6402_boards as static
Date: Thu, 10 Apr 2014 17:45:15 +0300
Message-ID: <20140410144515.GH26890@mwanda>
References: <20140410135447.GA11137@powerline.azcom-win.it>
 <20140410143800.GA16928@powerline.azcom-win.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20140410143800.GA16928@powerline.azcom-win.it>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Michele Curti <michele.curti@gmail.com>
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, abbotti@mev.co.uk, linux-next@vger.kernel.org, chase.southwood@yahoo.com
List-Id: linux-next.vger.kernel.org

On Thu, Apr 10, 2014 at 04:38:00PM +0200, Michele Curti wrote:
> 
> das6402_boards array is used in das6402.c only, so declare it as static.
> 
> Signed-off-by: Michele Curti <michele.curti@gmail.com>

Looks good.

regards,
dan carpenter

From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] staging: comedi: declare das6402_boards as static
Date: Thu, 10 Apr 2014 17:06:53 +0300
Message-ID: <20140410140653.GG26890@mwanda>
References: <20140410135447.GA11137@powerline.azcom-win.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20140410135447.GA11137@powerline.azcom-win.it>
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

On Thu, Apr 10, 2014 at 03:54:47PM +0200, Michele Curti wrote:
> Hi,
> das6402_boards array seems to be used in das6402.c only, so declare it 
> as static.
> 
> This patch applies to linux-next next-20140410.
> 
> Regards,
> Michele
> 

The patch is fine, but you have too much fluff in the changelog.  We
just apply patches automatically by saving the raw email as text
(including headers and everything) the we do a
`cat raw_email.txt | git am`.

Your changelog is all "Hello, how are you?  blah blah blah.  Best
wishes, etc.".  It should just say:

das6402_boards array is used in das6402.c only, so declare it as static.

Signed-off-by ...

You can put the "This patch applies to linux-next next-20140410" under
the --- cut off line so that we're aware but it doesn't get saved in the
log.  For staging it doesn't really matter, because either the patch
applies to linux-next or we'll ask you to redo it.

Please send a v2 with a terser changelog.

regards,
dan carpenter

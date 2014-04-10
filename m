From: Michele Curti <michele.curti@gmail.com>
Subject: [PATCH v2] staging: comedi: declare das6402_boards as static
Date: Thu, 10 Apr 2014 16:38:00 +0200
Message-ID: <20140410143800.GA16928@powerline.azcom-win.it>
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
To: abbotti@mev.co.uk, hsweeten@visionengravers.com, gregkh@linuxfoundation.org, chase.southwood@yahoo.com, devel@driverdev.osuosl.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org


das6402_boards array is used in das6402.c only, so declare it as static.

Signed-off-by: Michele Curti <michele.curti@gmail.com>
---
 drivers/staging/comedi/drivers/das6402.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/comedi/drivers/das6402.c b/drivers/staging/comedi/drivers/das6402.c
index e0cfb6c..d18eea6 100644
--- a/drivers/staging/comedi/drivers/das6402.c
+++ b/drivers/staging/comedi/drivers/das6402.c
@@ -125,7 +125,7 @@ struct das6402_boardinfo {
 	unsigned int maxdata;
 };
 
-struct das6402_boardinfo das6402_boards[] = {
+static struct das6402_boardinfo das6402_boards[] = {
 	{
 		.name		= "das6402-12",
 		.maxdata	= 0x0fff,
-- 
1.9.1

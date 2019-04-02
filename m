From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: linux-next: build failure after merge of the nand tree
Date: Tue, 2 Apr 2019 13:56:31 +0200
Message-ID: <20190402135631.38dcfe2a@xps13>
References: <20190402101431.6708cb70@canb.auug.org.au>
        <1554161512.10471.3@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554161512.10471.3@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Boris Brezillon <boris.brezillon@bootlin.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Paul,

Paul Cercueil <paul@crapouillou.net> wrote on Tue, 02 Apr 2019 01:31:52
+0200:

> Hi Stephen,
> 
> Le mar. 2 avril 2019 à 1:14, Stephen Rothwell <sfr@canb.auug.org.au> a écrit :
> > Hi all,
> > 
> > After merging the nand tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:26:5: error: redefinition > of 'ingenic_ecc_calculate'
> >  int ingenic_ecc_calculate(struct ingenic_ecc *ecc,
> >      ^~~~~~~~~~~~~~~~~~~~~
> > In file included from drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:14:
> > drivers/mtd/nand/raw/ingenic/ingenic_ecc.h:39:5: note: previous > definition of 'ingenic_ecc_calculate' was here
> >  int ingenic_ecc_calculate(struct ingenic_ecc *ecc,
> >      ^~~~~~~~~~~~~~~~~~~~~
> > drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:47:5: error: redefinition > of 'ingenic_ecc_correct'
> >  int ingenic_ecc_correct(struct ingenic_ecc *ecc,
> >      ^~~~~~~~~~~~~~~~~~~
> > In file included from drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:14:
> > drivers/mtd/nand/raw/ingenic/ingenic_ecc.h:46:5: note: previous > definition of 'ingenic_ecc_correct' was here
> >  int ingenic_ecc_correct(struct ingenic_ecc *ecc,
> >      ^~~~~~~~~~~~~~~~~~~
> > drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:93:21: error: redefinition > of 'of_ingenic_ecc_get'
> >  struct ingenic_ecc *of_ingenic_ecc_get(struct device_node *of_node)
> >                      ^~~~~~~~~~~~~~~~~~
> > In file included from drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:14:
> > drivers/mtd/nand/raw/ingenic/ingenic_ecc.h:57:21: note: previous > definition of 'of_ingenic_ecc_get' was here
> >  struct ingenic_ecc *of_ingenic_ecc_get(struct device_node *np)
> >                      ^~~~~~~~~~~~~~~~~~
> > drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:119:6: error: redefinition > of 'ingenic_ecc_release'
> >  void ingenic_ecc_release(struct ingenic_ecc *ecc)
> >       ^~~~~~~~~~~~~~~~~~~
> > In file included from drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:14:
> > drivers/mtd/nand/raw/ingenic/ingenic_ecc.h:53:6: note: previous > definition of 'ingenic_ecc_release' was here
> >  void ingenic_ecc_release(struct ingenic_ecc *ecc)
> >       ^~~~~~~~~~~~~~~~~~~
> > 
> > Caused by commit
> > 
> >   8278ad0d709a ("mtd: rawnand: ingenic: Separate top-level and SoC > specific code")
> > 
> > I have used the nand tree from next-20190401 for today.  
> 
> That makes no sense to me; from the offsets of the errors in the ingenic_ecc.h
> file, it seems that CONFIG_MTD_NAND_INGENIC_ECC is not set, and in this case
> ingenic_ecc.c should not be compiled at all.
> 

I think

        #ifdef FOO

evaluates to true if

        FOO=y

while we can have

        FOO=m

which is evaluated to false, hence the double definition with
allmodconfig.

Here is a diff solving the issue, if you are fine with it I will
correct in-place and push -f nand/next for tomorrow's build.

---8<---
diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.h b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.h
index d0486f963cc9..2cda439b5e11 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.h
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.h
@@ -25,7 +25,7 @@ struct ingenic_ecc_params {
        int strength;
 };
 
-#ifdef CONFIG_MTD_NAND_INGENIC_ECC
+#if IS_ENABLED(CONFIG_MTD_NAND_INGENIC_ECC)
 int ingenic_ecc_calculate(struct ingenic_ecc *ecc,
                          struct ingenic_ecc_params *params,
                          const u8 *buf, u8 *ecc_code);
--->8---


Thanks,
Miquèl

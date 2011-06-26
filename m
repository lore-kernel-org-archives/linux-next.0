From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 2/2] mtd/ofpart: add ofoldpart alias
Date: Sun, 26 Jun 2011 17:35:35 -0600
Message-ID: <BANLkTi=G30BB66a6cbTWbmfd0Zokm2Kz3A@mail.gmail.com>
References: <1309122180-12838-1-git-send-email-dbaryshkov@gmail.com>
	<1309122180-12838-3-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1309122180-12838-3-git-send-email-dbaryshkov@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, dedekind1@gmail.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: linux-next.vger.kernel.org

On Sun, Jun 26, 2011 at 3:03 PM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
> ofpart.ko also provides ofoldpart MTD parser. Add respective
> MODULE_ALIAS("ofoldpart"); declaration.
>
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

Is MODULE_ALIAS actually necessary for what is essentially a library
module?  I though MODULE_ALIAS was only needed to trigger loading a
module for specific hardware.  In this case, the module should be
autoloaded when another module needs it.  I may be misinformed though,
my module-foo is a little rusty.

g.

> ---
> =A0drivers/mtd/ofpart.c | =A0 =A01 +
> =A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
> index aa33b8a..c4b8d17 100644
> --- a/drivers/mtd/ofpart.c
> +++ b/drivers/mtd/ofpart.c
> @@ -176,3 +176,4 @@ module_init(ofpart_parser_init);
> =A0MODULE_LICENSE("GPL");
> =A0MODULE_DESCRIPTION("Parser for MTD partitioning information in device =
tree");
> =A0MODULE_AUTHOR("Vitaly Wool, David Gibson");
> +MODULE_ALIAS("ofoldpart");
> --
> 1.7.5.4
>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

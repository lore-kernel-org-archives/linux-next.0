From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: [PATCH 3.7.0 3/9] i82975x_edac.c: cleanup debug code
Date: Mon, 17 Dec 2012 12:45:11 -0200
Message-ID: <20121217124511.66825216@redhat.com>
References: <CAA_L+UNa-C0XvzMbXMf9GchtfacfwJMYt2uuXkWVntWPWANLsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAA_L+UNa-C0XvzMbXMf9GchtfacfwJMYt2uuXkWVntWPWANLsA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arvind R <arvino55@gmail.com>
Cc: linux-edac@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Em Sun, 16 Dec 2012 02:10:39 +0530
Arvind R <arvino55@gmail.com> escreveu:

> Subject: [PATCH 3.7.0 3/9] i82975x_edac.c: cleanup debug code
> 
> modify debug levels to sane levels. Also move random debug code
> into CONFIG_EDAC_DEBUG sections.
> Signed-off-by: Arvind R. <arvino55@gmail.com>
> ---
>  i82975x_edac.c |  171 +++++++++++++++++++++++-------------------
>  1 file changed, 97 insertions(+), 74 deletions(-)
> 
> --- a/drivers/edac/i82975x_edac.c	2012-12-15 20:18:24 +0530
> +++ b/drivers/edac/i82975x_edac.c	2012-12-15 20:17:58 +0530
...
> @@ -551,11 +583,11 @@ static int i82975x_probe1(struct pci_dev
>  	layers[1].is_virt_csrow = false;
>  	mci = edac_mc_alloc(0, ARRAY_SIZE(layers), layers, sizeof(*pvt));
>  	if (!mci) {
> +		edac_dbg(0, "MC%d failed mc_alloc\n", dev_idx);
>  		rc = -ENOMEM;
>  		goto fail1;

Please remove the two last lines. There's no reason why it a driver 
should bail out just because debug is enabled.


Cheers,
Mauro

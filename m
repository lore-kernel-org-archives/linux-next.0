From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] staging: ft1000: fix braces warning
Date: Tue, 03 Feb 2015 11:05:08 -0800
Message-ID: <1422990308.30476.37.camel@perches.com>
References: <1422989883-16937-1-git-send-email-bilel.dr@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422989883-16937-1-git-send-email-bilel.dr@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bilel DRIRA <bilel.dr@gmail.com>
Cc: marek.belisko@gmail.com, gregkh@linuxfoundation.org, tapaswenipathak@gmail.com, gdonald@gmail.com, aybuke.147@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, 2015-02-03 at 19:58 +0100, Bilel DRIRA wrote:
> This patch fix the checkpatch.pl WARNING:
[]
> diff --git a/drivers/staging/ft1000/ft1000-pcmcia/ft1000_hw.c b/drivers/staging/ft1000/ft1000-pcmcia/ft1000_hw.c
[]
> @@ -1963,11 +1948,10 @@ static irqreturn_t ft1000_interrupt(int irq, void *dev_id)
>  						ft1000_read_reg(dev,
>  								FT1000_REG_MAG_DFSR);
>  				}
> -				if (tempword & 0x1f) {
> +				if (tempword & 0x1f)
>  					ft1000_copy_up_pkt(dev);
> -				} else {
> +				else
>  					break;
> -				}
>  				cnt++;
>  			} while (cnt < MAX_RCV_LOOP);
>  

trivia: the logic here is generally better inverted:

				if (!(tempword & 0x1f))
					break;
				ft1000_copy_up_pkt(dev);
				cnt++;
			} while (cnt < etc...)

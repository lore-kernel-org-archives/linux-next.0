From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: manual merge of the gpio tree with the pm tree
Date: Tue, 19 Nov 2013 08:52:13 +0100
Message-ID: <CACRpkdbSrWK2iaajYd7c-5sRXk+Cv2+s2TLbt4N8LzVKSKamNg@mail.gmail.com>
References: <20131119124357.a6191743b0f568d40c8291d5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131119124357.a6191743b0f568d40c8291d5@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
List-Id: linux-next.vger.kernel.org

On Tue, Nov 19, 2013 at 2:43 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the gpio tree got a conflict in
> drivers/gpio/gpiolib.c between commit 7b1998116bbb ("ACPI / driver core:
> Store an ACPI device pointer in struct acpi_dev_node") from the pm tree
> and commit f760f1967ee8 ("gpiolib: use dedicated flags for GPIO
> properties") from the gpio tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Oh I never saw that patch before ... anyway it seems to be
correct, thanks.

Yours,
Linus Walleij

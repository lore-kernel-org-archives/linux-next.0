From: Olof Johansson <olof@lixom.net>
Subject: Re: linux-next: manual merge of the devicetree tree with the arm-soc tree
Date: Wed, 12 Mar 2014 15:36:58 -0700
Message-ID: <CAOesGMiK-8_0vt7jWSMT3oaoPUz5fS92ztknC-HhsEYt2XCNZQ@mail.gmail.com>
References: <20140312220350.3c35bce7dff139a73a9c8262@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140312220350.3c35bce7dff139a73a9c8262@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Mar 12, 2014 at 3:03 PM, Mark Brown <broonie@kernel.org> wrote:
> Hi Grant,
>
> Today's linux-next merge of the devicetree tree got a conflict in include/asm-generic/vmlinux.lds.h between commit 6c3ff8b11a16ec69 ("ARM: Introduce CPU_METHOD_OF_DECLARE() for cpu hotplug/smp") from the  tree and commit f618c4703a14672d27 ("drivers: of: add support for custom reserved memory drivers") from the devicetree tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

LGTM from the arm-soc side.


-Olof

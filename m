From: Vinod Koul <vkoul@kernel.org>
Subject: Re: linux-next: Tree for Dec 21
Date: Mon, 31 Dec 2018 19:31:02 +0530
Message-ID: <20181231140102.GC7581@vkoul-mobl>
References: <20181221193244.3a6ed685@canb.auug.org.au>
 <20181221162149.GA32500@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181221162149.GA32500@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, Peng Ma <peng.ma@nxp.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joel Fernandes <joel@joelfernandes.org>, "Kirill A. Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, Sinan Kaya <okaya@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Chandan Rajendra <chandan@linux.vnet.ibm.com>, Theodore Ts'o <tytso@mit.edu>, Florian Westphal <fw@strlen.de>, "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wen He <wen.he_1@nxp.com>, Palmer Dabbelt <palmer@sifive.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>, Ard Biesheuvel <ard.b>
List-Id: linux-next.vger.kernel.org

On 21-12-18, 08:21, Guenter Roeck wrote:
> On Fri, Dec 21, 2018 at 07:32:44PM +1100, Stephen Rothwell wrote:

> [6]:
> 
> Build failure.
> 
> # bad: [340ae71f9dd421227a58c14a909b63033745dca4] Add linux-next specific files for 20181221
> # good: [7566ec393f4161572ba6f11ad5171fd5d59b0fbd] Linux 4.20-rc7
> git bisect start 'HEAD' 'v4.20-rc7'
> # good: [9f3de88514b2b5666214f0be3bc98d4e7136a7f1] Merge remote-tracking branch 'mtd/mtd/next'
> git bisect good 9f3de88514b2b5666214f0be3bc98d4e7136a7f1
> # good: [f4dd556a2cc77f672b9ba585aaad094a6fe09cf7] Merge remote-tracking branch 'spi/for-next'
> git bisect good f4dd556a2cc77f672b9ba585aaad094a6fe09cf7
> # good: [75f0840128c421df5e1741f5df22a34409bb5d72] Merge remote-tracking branch 'char-misc/char-misc-next'
> git bisect good 75f0840128c421df5e1741f5df22a34409bb5d72
> # bad: [4faff5eba474594068ea7f4542af209ab3e66911] Merge remote-tracking branch 'scsi/for-next'
> git bisect bad 4faff5eba474594068ea7f4542af209ab3e66911
> # good: [e894075934a44ef66413fd1046808542011d8552] staging: mt7621-mmc: Fix incompletely removed #if 0 block in sd.c
> git bisect good e894075934a44ef66413fd1046808542011d8552
> # good: [c1b104755b0b11579e292aa153c0605264c81648] scsi: smartpqi: add support for huawei controllers
> git bisect good c1b104755b0b11579e292aa153c0605264c81648
> # good: [695e62f9d1350169ed2bb6c5f164a6a1b1aaae50] Merge remote-tracking branch 'icc/icc-next'
> git bisect good 695e62f9d1350169ed2bb6c5f164a6a1b1aaae50
> # bad: [2b4b64840d7f6929213c0abce72eec7b7b784949] Merge branch 'topic/fsl' into next
> git bisect bad 2b4b64840d7f6929213c0abce72eec7b7b784949
> # good: [c03ec9cbc1c18058d5175998dffec24e40cb709f] Merge branch 'topic/dw' into next
> git bisect good c03ec9cbc1c18058d5175998dffec24e40cb709f
> # good: [1fa4ce0b2caccfd5fb0a37a03cade2ee1dbb0452] Merge branch 'topic/dmatest' into next
> git bisect good 1fa4ce0b2caccfd5fb0a37a03cade2ee1dbb0452
> # good: [531971231dac0edf17af32b06f09681f6506c0a1] dmaengine: sprd: Add me as one of the module authors
> git bisect good 531971231dac0edf17af32b06f09681f6506c0a1
> # bad: [b1bd47b638d4d304b98f68abfee9ee897c1a1939] dt-bindings: fsl-qdma: Add NXP Layerscpae qDMA controller bindings
> git bisect bad b1bd47b638d4d304b98f68abfee9ee897c1a1939
> # bad: [68997fff94afa51b5f74dd90aceec74ce13b3253] dmaengine: fsldma: Adding macro FSL_DMA_IN/OUT implement for ARM platform
> git bisect bad 68997fff94afa51b5f74dd90aceec74ce13b3253
> # good: [ca4f826040111c6746e2378dc45d9c0af3991a09] dmaengine: fsldma: Replace DMA_IN/OUT by FSL_DMA_IN/OUT
> git bisect good ca4f826040111c6746e2378dc45d9c0af3991a09
> # first bad commit: [68997fff94afa51b5f74dd90aceec74ce13b3253] dmaengine: fsldma: Adding macro FSL_DMA_IN/OUT implement for ARM platform

Dropping these

-- 
~Vinod

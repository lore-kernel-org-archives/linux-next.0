From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: next-20181008 build: 2 failures 22 warnings (next-20181008)
Date: Mon, 8 Oct 2018 16:30:06 -0500
Message-ID: <20181008213006.GP120535@bhelgaas-glaptop.roam.corp.google.com>
References: <E1g9cV0-0008Sg-4U@optimist> <20181008212021.GB4440@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181008212021.GB4440@sirena.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>
Cc: linaro-kernel@lists.linaro.org, kernel-build-reports@lists.linaro.org, linux-pci@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Keith Busch <keith.busch@intel.com>, linux-next@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

On Mon, Oct 08, 2018 at 10:20:21PM +0100, Mark Brown wrote:
> On Mon, Oct 08, 2018 at 09:51:30PM +0100, Build bot for Mark Brown wrote:
> 
> Today's -next fails to build an arm allmodconfig caused by:
> 
> > 	arm-allmodconfig
> > ../drivers/pci/pcie/aer_inject.c:444:6: error: 'struct pt_regs' has no member named 'ip'
> 
> introduced in e3fbcc7c4b130(PCI/AER: Covertly inject errors with ftrace
> hooks).  This field is not present on arm.

I dropped e3fbcc7c4b130 and related patches already, so this should be gone
in my current "next" branch (18b4baa4d9fc).

From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 2/2 V2] dmaengine: add context parameter to prep_slave_sg
 and prep_dma_cyclic
Date: Thu, 22 Mar 2012 16:18:47 -0400
Message-ID: <CAP=VYLp0ACstgS9PULAnowpAPOGVKVKFbFg0zVCX4CKeMTAwnA@mail.gmail.com>
References: <1331238913-25818-1-git-send-email-alexandre.bounine@idt.com>
	<1331238913-25818-3-git-send-email-alexandre.bounine@idt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1331238913-25818-3-git-send-email-alexandre.bounine@idt.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Bounine <alexandre.bounine@idt.com>
Cc: vinod.koul@intel.com, dan.j.williams@intel.com, linux@arm.linux.org.uk, linux-kernel@vger.kernel.org, jaswinder.singh@linaro.org, linus.walleij@stericsson.com, leoli@freescale.com, zw@zh-kernel.org, STEricsson_nomadik_linux@list.st.com, ben-linux@fluff.org, kgene.kim@samsung.com, mchehab@infradead.org, ludovic.desroches@atmel.com, cjb@laptop.org, g.liakhovetski@gmx.de, ian@mnementh.co.uk, dwmw2@infradead.org, grant.likely@secretlab.ca, alan@linux.intel.com, balbi@ti.com, FlorianSchandinat@gmx.de, perex@perex.cz, tiwai@suse.de, viresh.kumar@st.com, baohua.song@csr.com, srinidhi.kasagar@stericsson.com, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, Mar 8, 2012 at 3:35 PM, Alexandre Bounine
<alexandre.bounine@idt.com> wrote:
> Add context parameter to device_prep_slave_sg() and device_prep_dma_c=
yclic()
> interfaces to allow passing client/target specific information associ=
ated
> with the data transfer.
> Modify all affected DMA engine drivers.

Hi Alexandre,

Can you have a look at this failure in linux-next:

http://kisskb.ellerman.id.au/kisskb/buildresult/5933610/

sound/soc/soc-dmaengine-pcm.c:149:3: error: too few arguments to
function 'chan->device->device_prep_dma_cyclic'
make[3]: *** [sound/soc/soc-dmaengine-pcm.o] Error 1

I think it is caused by this commit.

Thanks,
Paul.

>
> Signed-off-by: Alexandre Bounine <alexandre.bounine@idt.com>
> ---
> =A0drivers/dma/amba-pl08x.c =A0 =A0| =A0 =A02 +-
> =A0drivers/dma/at_hdmac.c =A0 =A0 =A0| =A0 =A07 +++++--
> =A0drivers/dma/coh901318.c =A0 =A0 | =A0 =A02 +-
> =A0drivers/dma/dw_dmac.c =A0 =A0 =A0 | =A0 =A02 +-
> =A0drivers/dma/ep93xx_dma.c =A0 =A0| =A0 =A06 ++++--
> =A0drivers/dma/fsldma.c =A0 =A0 =A0 =A0| =A0 =A04 +++-
> =A0drivers/dma/imx-dma.c =A0 =A0 =A0 | =A0 =A05 +++--
> =A0drivers/dma/imx-sdma.c =A0 =A0 =A0| =A0 =A05 +++--
> =A0drivers/dma/intel_mid_dma.c | =A0 =A03 ++-
> =A0drivers/dma/ipu/ipu_idmac.c | =A0 =A03 ++-
> =A0drivers/dma/mxs-dma.c =A0 =A0 =A0 | =A0 =A05 +++--
> =A0drivers/dma/pch_dma.c =A0 =A0 =A0 | =A0 =A03 ++-
> =A0drivers/dma/pl330.c =A0 =A0 =A0 =A0 | =A0 =A05 +++--
> =A0drivers/dma/shdma.c =A0 =A0 =A0 =A0 | =A0 =A03 ++-
> =A0drivers/dma/sirf-dma.c =A0 =A0 =A0| =A0 =A02 +-
> =A0drivers/dma/ste_dma40.c =A0 =A0 | =A0 =A05 +++--
> =A0drivers/dma/timb_dma.c =A0 =A0 =A0| =A0 =A03 ++-
> =A0drivers/dma/txx9dmac.c =A0 =A0 =A0| =A0 =A02 +-
> =A0include/linux/dmaengine.h =A0 | =A0 12 +++++++-----
> =A019 files changed, 49 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
> index 8a28158..776f9e2 100644
> --- a/drivers/dma/amba-pl08x.c
> +++ b/drivers/dma/amba-pl08x.c
> @@ -1326,7 +1326,7 @@ static struct dma_async_tx_descriptor *pl08x_pr=
ep_dma_memcpy(
> =A0static struct dma_async_tx_descriptor *pl08x_prep_slave_sg(
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct dma_chan *chan, struct scatterl=
ist *sgl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned int sg_len, enum dma_transfer=
_direction direction,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long flags)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long flags, void *context)
> =A0{
> =A0 =A0 =A0 =A0struct pl08x_dma_chan *plchan =3D to_pl08x_chan(chan);
> =A0 =A0 =A0 =A0struct pl08x_driver_data *pl08x =3D plchan->host;
> diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> index f4aed5f..e1a1d42 100644
> --- a/drivers/dma/at_hdmac.c
> +++ b/drivers/dma/at_hdmac.c
> @@ -659,11 +659,12 @@ err_desc_get:
> =A0* @sg_len: number of entries in @scatterlist
> =A0* @direction: DMA direction
> =A0* @flags: tx descriptor status flags
> + * @context: transaction context (ignored)
> =A0*/
> =A0static struct dma_async_tx_descriptor *
> =A0atc_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned int sg_len, enum dma_transfer=
_direction direction,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long flags)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long flags, void *context)
> =A0{
> =A0 =A0 =A0 =A0struct at_dma_chan =A0 =A0 =A0*atchan =3D to_at_dma_ch=
an(chan);
> =A0 =A0 =A0 =A0struct at_dma_slave =A0 =A0 *atslave =3D chan->private=
;
> @@ -860,10 +861,12 @@ atc_dma_cyclic_fill_desc(struct at_dma_slave *a=
tslave, struct at_desc *desc,
> =A0* @buf_len: total number of bytes for the entire buffer
> =A0* @period_len: number of bytes for each period
> =A0* @direction: transfer direction, to or from device
> + * @context: transfer context (ignored)
> =A0*/
> =A0static struct dma_async_tx_descriptor *
> =A0atc_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t buf_addr, si=
ze_t buf_len,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 size_t period_len, enum dma_transfer_di=
rection direction)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 size_t period_len, enum dma_transfer_di=
rection direction,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 void *context)
> =A0{
> =A0 =A0 =A0 =A0struct at_dma_chan =A0 =A0 =A0*atchan =3D to_at_dma_ch=
an(chan);
> =A0 =A0 =A0 =A0struct at_dma_slave =A0 =A0 *atslave =3D chan->private=
;
> diff --git a/drivers/dma/coh901318.c b/drivers/dma/coh901318.c
> index d65a718..f42b54e 100644
> --- a/drivers/dma/coh901318.c
> +++ b/drivers/dma/coh901318.c
> @@ -1035,7 +1035,7 @@ coh901318_prep_memcpy(struct dma_chan *chan, dm=
a_addr_t dest, dma_addr_t src,
> =A0static struct dma_async_tx_descriptor *
> =A0coh901318_prep_slave_sg(struct dma_chan *chan, struct scatterlist =
*sgl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned int sg_len, e=
num dma_transfer_direction direction,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long flags)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long flags, vo=
id *context)
> =A0{
> =A0 =A0 =A0 =A0struct coh901318_chan *cohc =3D to_coh901318_chan(chan=
);
> =A0 =A0 =A0 =A0struct coh901318_lli *lli;
> diff --git a/drivers/dma/dw_dmac.c b/drivers/dma/dw_dmac.c
> index 9b592b0..058bddf 100644
> --- a/drivers/dma/dw_dmac.c
> +++ b/drivers/dma/dw_dmac.c
> @@ -731,7 +731,7 @@ err_desc_get:
> =A0static struct dma_async_tx_descriptor *
> =A0dwc_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned int sg_len, enum dma_transfer=
_direction direction,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long flags)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long flags, void *context)
> =A0{
> =A0 =A0 =A0 =A0struct dw_dma_chan =A0 =A0 =A0*dwc =3D to_dw_dma_chan(=
chan);
> =A0 =A0 =A0 =A0struct dw_dma_slave =A0 =A0 *dws =3D chan->private;
> diff --git a/drivers/dma/ep93xx_dma.c b/drivers/dma/ep93xx_dma.c
> index 59e7a96..c79de61 100644
> --- a/drivers/dma/ep93xx_dma.c
> +++ b/drivers/dma/ep93xx_dma.c
> @@ -983,13 +983,14 @@ fail:
> =A0* @sg_len: number of entries in @sgl
> =A0* @dir: direction of tha DMA transfer
> =A0* @flags: flags for the descriptor
> + * @context: operation context (ignored)
> =A0*
> =A0* Returns a valid DMA descriptor or %NULL in case of failure.
> =A0*/
> =A0static struct dma_async_tx_descriptor *
> =A0ep93xx_dma_prep_slave_sg(struct dma_chan *chan, struct scatterlist=
 *sgl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned int sg_len, =
enum dma_transfer_direction dir,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned long flags)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned long flags,=
 void *context)
> =A0{
> =A0 =A0 =A0 =A0struct ep93xx_dma_chan *edmac =3D to_ep93xx_dma_chan(c=
han);
> =A0 =A0 =A0 =A0struct ep93xx_dma_desc *desc, *first;
> @@ -1056,6 +1057,7 @@ fail:
> =A0* @buf_len: length of the buffer (in bytes)
> =A0* @period_len: lenght of a single period
> =A0* @dir: direction of the operation
> + * @context: operation context (ignored)
> =A0*
> =A0* Prepares a descriptor for cyclic DMA operation. This means that =
once the
> =A0* descriptor is submitted, we will be submitting in a @period_len =
sized
> @@ -1068,7 +1070,7 @@ fail:
> =A0static struct dma_async_tx_descriptor *
> =A0ep93xx_dma_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t dma_a=
ddr,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 size_t buf_len, s=
ize_t period_len,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0enum dma_transfe=
r_direction dir)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0enum dma_transfe=
r_direction dir, void *context)
> =A0{
> =A0 =A0 =A0 =A0struct ep93xx_dma_chan *edmac =3D to_ep93xx_dma_chan(c=
han);
> =A0 =A0 =A0 =A0struct ep93xx_dma_desc *desc, *first;
> diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
> index b98070c..51d33e5 100644
> --- a/drivers/dma/fsldma.c
> +++ b/drivers/dma/fsldma.c
> @@ -765,6 +765,7 @@ fail:
> =A0* @sg_len: number of entries in @scatterlist
> =A0* @direction: DMA direction
> =A0* @flags: DMAEngine flags
> + * @context: transaction context (ignored)
> =A0*
> =A0* Prepare a set of descriptors for a DMA_SLAVE transaction. Follow=
ing the
> =A0* DMA_SLAVE API, this gets the device-specific information from th=
e
> @@ -772,7 +773,8 @@ fail:
> =A0*/
> =A0static struct dma_async_tx_descriptor *fsl_dma_prep_slave_sg(
> =A0 =A0 =A0 =A0struct dma_chan *dchan, struct scatterlist *sgl, unsig=
ned int sg_len,
> - =A0 =A0 =A0 enum dma_transfer_direction direction, unsigned long fl=
ags)
> + =A0 =A0 =A0 enum dma_transfer_direction direction, unsigned long fl=
ags,
> + =A0 =A0 =A0 void *context)
> =A0{
> =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 * This operation is not supported on the Freescale DM=
A controller
> diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
> index e4383ee..42d5dc5 100644
> --- a/drivers/dma/imx-dma.c
> +++ b/drivers/dma/imx-dma.c
> @@ -225,7 +225,7 @@ static void imxdma_free_chan_resources(struct dma=
_chan *chan)
> =A0static struct dma_async_tx_descriptor *imxdma_prep_slave_sg(
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct dma_chan *chan, struct scatterl=
ist *sgl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned int sg_len, enum dma_transfer=
_direction direction,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long flags)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long flags, void *context)
> =A0{
> =A0 =A0 =A0 =A0struct imxdma_channel *imxdmac =3D to_imxdma_chan(chan=
);
> =A0 =A0 =A0 =A0struct scatterlist *sg;
> @@ -271,7 +271,8 @@ static struct dma_async_tx_descriptor *imxdma_pre=
p_slave_sg(
>
> =A0static struct dma_async_tx_descriptor *imxdma_prep_dma_cyclic(
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct dma_chan *chan, dma_addr_t dma_=
addr, size_t buf_len,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 size_t period_len, enum dma_transfer_di=
rection direction)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 size_t period_len, enum dma_transfer_di=
rection direction,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 void *context)
> =A0{
> =A0 =A0 =A0 =A0struct imxdma_channel *imxdmac =3D to_imxdma_chan(chan=
);
> =A0 =A0 =A0 =A0struct imxdma_engine *imxdma =3D imxdmac->imxdma;
> diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> index 8bc5acf..5313946 100644
> --- a/drivers/dma/imx-sdma.c
> +++ b/drivers/dma/imx-sdma.c
> @@ -917,7 +917,7 @@ static void sdma_free_chan_resources(struct dma_c=
han *chan)
> =A0static struct dma_async_tx_descriptor *sdma_prep_slave_sg(
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct dma_chan *chan, struct scatterl=
ist *sgl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned int sg_len, enum dma_transfer=
_direction direction,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long flags)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long flags, void *context)
> =A0{
> =A0 =A0 =A0 =A0struct sdma_channel *sdmac =3D to_sdma_chan(chan);
> =A0 =A0 =A0 =A0struct sdma_engine *sdma =3D sdmac->sdma;
> @@ -1015,7 +1015,8 @@ err_out:
>
> =A0static struct dma_async_tx_descriptor *sdma_prep_dma_cyclic(
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct dma_chan *chan, dma_addr_t dma_=
addr, size_t buf_len,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 size_t period_len, enum dma_transfer_di=
rection direction)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 size_t period_len, enum dma_transfer_di=
rection direction,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 void *context)
> =A0{
> =A0 =A0 =A0 =A0struct sdma_channel *sdmac =3D to_sdma_chan(chan);
> =A0 =A0 =A0 =A0struct sdma_engine *sdma =3D sdmac->sdma;
> diff --git a/drivers/dma/intel_mid_dma.c b/drivers/dma/intel_mid_dma.=
c
> index 74f70aa..2a202e5 100644
> --- a/drivers/dma/intel_mid_dma.c
> +++ b/drivers/dma/intel_mid_dma.c
> @@ -732,13 +732,14 @@ err_desc_get:
> =A0* @sg_len: length of sg txn
> =A0* @direction: DMA transfer dirtn
> =A0* @flags: DMA flags
> + * @context: transfer context (ignored)
> =A0*
> =A0* Prepares LLI based periphral transfer
> =A0*/
> =A0static struct dma_async_tx_descriptor *intel_mid_dma_prep_slave_sg=
(
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct dma_chan *chan,=
 struct scatterlist *sgl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned int sg_len, e=
num dma_transfer_direction direction,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long flags)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long flags, vo=
id *context)
> =A0{
> =A0 =A0 =A0 =A0struct intel_mid_dma_chan *midc =3D NULL;
> =A0 =A0 =A0 =A0struct intel_mid_dma_slave *mids =3D NULL;
> diff --git a/drivers/dma/ipu/ipu_idmac.c b/drivers/dma/ipu/ipu_idmac.=
c
> index 6212b16..aadd57c 100644
> --- a/drivers/dma/ipu/ipu_idmac.c
> +++ b/drivers/dma/ipu/ipu_idmac.c
> @@ -1341,7 +1341,8 @@ static void ipu_gc_tasklet(unsigned long arg)
> =A0/* Allocate and initialise a transfer descriptor. */
> =A0static struct dma_async_tx_descriptor *idmac_prep_slave_sg(struct =
dma_chan *chan,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct scatterlist *sgl, unsigned int =
sg_len,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 enum dma_transfer_direction direction, =
unsigned long tx_flags)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 enum dma_transfer_direction direction, =
unsigned long tx_flags,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 void *context)
> =A0{
> =A0 =A0 =A0 =A0struct idmac_channel *ichan =3D to_idmac_chan(chan);
> =A0 =A0 =A0 =A0struct idmac_tx_desc *desc =3D NULL;
> diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
> index b06cd4c..3e65974 100644
> --- a/drivers/dma/mxs-dma.c
> +++ b/drivers/dma/mxs-dma.c
> @@ -352,7 +352,7 @@ static void mxs_dma_free_chan_resources(struct dm=
a_chan *chan)
> =A0static struct dma_async_tx_descriptor *mxs_dma_prep_slave_sg(
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct dma_chan *chan, struct scatterl=
ist *sgl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned int sg_len, enum dma_transfer=
_direction direction,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long append)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long append, void *context)
> =A0{
> =A0 =A0 =A0 =A0struct mxs_dma_chan *mxs_chan =3D to_mxs_dma_chan(chan=
);
> =A0 =A0 =A0 =A0struct mxs_dma_engine *mxs_dma =3D mxs_chan->mxs_dma;
> @@ -447,7 +447,8 @@ err_out:
>
> =A0static struct dma_async_tx_descriptor *mxs_dma_prep_dma_cyclic(
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct dma_chan *chan, dma_addr_t dma_=
addr, size_t buf_len,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 size_t period_len, enum dma_transfer_di=
rection direction)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 size_t period_len, enum dma_transfer_di=
rection direction,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 void *context)
> =A0{
> =A0 =A0 =A0 =A0struct mxs_dma_chan *mxs_chan =3D to_mxs_dma_chan(chan=
);
> =A0 =A0 =A0 =A0struct mxs_dma_engine *mxs_dma =3D mxs_chan->mxs_dma;
> diff --git a/drivers/dma/pch_dma.c b/drivers/dma/pch_dma.c
> index 823f581..d0a334d 100644
> --- a/drivers/dma/pch_dma.c
> +++ b/drivers/dma/pch_dma.c
> @@ -607,7 +607,8 @@ static void pd_issue_pending(struct dma_chan *cha=
n)
>
> =A0static struct dma_async_tx_descriptor *pd_prep_slave_sg(struct dma=
_chan *chan,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct scatterlist *sg=
l, unsigned int sg_len,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 enum dma_transfer_direc=
tion direction, unsigned long flags)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 enum dma_transfer_direc=
tion direction, unsigned long flags,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 void *context)
> =A0{
> =A0 =A0 =A0 =A0struct pch_dma_chan *pd_chan =3D to_pd_chan(chan);
> =A0 =A0 =A0 =A0struct pch_dma_slave *pd_slave =3D chan->private;
> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index b8ec03e..1e8dee6 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -621,7 +621,8 @@ static inline int get_burst_len(struct dma_pl330_=
desc *desc, size_t len)
>
> =A0static struct dma_async_tx_descriptor *pl330_prep_dma_cyclic(
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct dma_chan *chan, dma_addr_t dma_=
addr, size_t len,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 size_t period_len, enum dma_transfer_di=
rection direction)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 size_t period_len, enum dma_transfer_di=
rection direction,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 void *context)
> =A0{
> =A0 =A0 =A0 =A0struct dma_pl330_desc *desc;
> =A0 =A0 =A0 =A0struct dma_pl330_chan *pch =3D to_pchan(chan);
> @@ -711,7 +712,7 @@ pl330_prep_dma_memcpy(struct dma_chan *chan, dma_=
addr_t dst,
> =A0static struct dma_async_tx_descriptor *
> =A0pl330_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl=
,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned int sg_len, enum dma_transfer=
_direction direction,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long flg)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long flg, void *context)
> =A0{
> =A0 =A0 =A0 =A0struct dma_pl330_desc *first, *desc =3D NULL;
> =A0 =A0 =A0 =A0struct dma_pl330_chan *pch =3D to_pchan(chan);
> diff --git a/drivers/dma/shdma.c b/drivers/dma/shdma.c
> index 812fd76..6b94f22 100644
> --- a/drivers/dma/shdma.c
> +++ b/drivers/dma/shdma.c
> @@ -673,7 +673,8 @@ static struct dma_async_tx_descriptor *sh_dmae_pr=
ep_memcpy(
>
> =A0static struct dma_async_tx_descriptor *sh_dmae_prep_slave_sg(
> =A0 =A0 =A0 =A0struct dma_chan *chan, struct scatterlist *sgl, unsign=
ed int sg_len,
> - =A0 =A0 =A0 enum dma_transfer_direction direction, unsigned long fl=
ags)
> + =A0 =A0 =A0 enum dma_transfer_direction direction, unsigned long fl=
ags,
> + =A0 =A0 =A0 void *context)
> =A0{
> =A0 =A0 =A0 =A0struct sh_dmae_slave *param;
> =A0 =A0 =A0 =A0struct sh_dmae_chan *sh_chan;
> diff --git a/drivers/dma/sirf-dma.c b/drivers/dma/sirf-dma.c
> index 2333810..b899a86 100644
> --- a/drivers/dma/sirf-dma.c
> +++ b/drivers/dma/sirf-dma.c
> @@ -497,7 +497,7 @@ err_dir:
> =A0static struct dma_async_tx_descriptor *
> =A0sirfsoc_dma_prep_cyclic(struct dma_chan *chan, dma_addr_t addr,
> =A0 =A0 =A0 =A0size_t buf_len, size_t period_len,
> - =A0 =A0 =A0 enum dma_transfer_direction direction)
> + =A0 =A0 =A0 enum dma_transfer_direction direction, void *context)
> =A0{
> =A0 =A0 =A0 =A0struct sirfsoc_dma_chan *schan =3D dma_chan_to_sirfsoc=
_dma_chan(chan);
> =A0 =A0 =A0 =A0struct sirfsoc_dma_desc *sdesc =3D NULL;
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index cc5ecbc..3cbf78e 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -2299,7 +2299,8 @@ static struct dma_async_tx_descriptor *d40_prep=
_slave_sg(struct dma_chan *chan,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct scatterlist *sgl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned int sg_len,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 enum dma_transfer_direction di=
rection,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned long dma_flags)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned long dma_flags,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0void *context)
> =A0{
> =A0 =A0 =A0 =A0if (direction !=3D DMA_DEV_TO_MEM && direction !=3D DM=
A_MEM_TO_DEV)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return NULL;
> @@ -2310,7 +2311,7 @@ static struct dma_async_tx_descriptor *d40_prep=
_slave_sg(struct dma_chan *chan,
> =A0static struct dma_async_tx_descriptor *
> =A0dma40_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t dma_addr,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 size_t buf_len, size_t period=
_len,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0enum dma_transfer_direction =
direction)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0enum dma_transfer_direction =
direction, void *context)
> =A0{
> =A0 =A0 =A0 =A0unsigned int periods =3D buf_len / period_len;
> =A0 =A0 =A0 =A0struct dma_async_tx_descriptor *txd;
> diff --git a/drivers/dma/timb_dma.c b/drivers/dma/timb_dma.c
> index a6f9c16..a4c61ed 100644
> --- a/drivers/dma/timb_dma.c
> +++ b/drivers/dma/timb_dma.c
> @@ -558,7 +558,8 @@ static void td_issue_pending(struct dma_chan *cha=
n)
>
> =A0static struct dma_async_tx_descriptor *td_prep_slave_sg(struct dma=
_chan *chan,
> =A0 =A0 =A0 =A0struct scatterlist *sgl, unsigned int sg_len,
> - =A0 =A0 =A0 enum dma_transfer_direction direction, unsigned long fl=
ags)
> + =A0 =A0 =A0 enum dma_transfer_direction direction, unsigned long fl=
ags,
> + =A0 =A0 =A0 void *context)
> =A0{
> =A0 =A0 =A0 =A0struct timb_dma_chan *td_chan =3D
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0container_of(chan, struct timb_dma_cha=
n, chan);
> diff --git a/drivers/dma/txx9dmac.c b/drivers/dma/txx9dmac.c
> index 6122c36..fa66ebb 100644
> --- a/drivers/dma/txx9dmac.c
> +++ b/drivers/dma/txx9dmac.c
> @@ -846,7 +846,7 @@ txx9dmac_prep_dma_memcpy(struct dma_chan *chan, d=
ma_addr_t dest, dma_addr_t src,
> =A0static struct dma_async_tx_descriptor *
> =A0txx9dmac_prep_slave_sg(struct dma_chan *chan, struct scatterlist *=
sgl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned int sg_len, enum dma_transfer=
_direction direction,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long flags)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long flags, void *context)
> =A0{
> =A0 =A0 =A0 =A0struct txx9dmac_chan *dc =3D to_txx9dmac_chan(chan);
> =A0 =A0 =A0 =A0struct txx9dmac_dev *ddev =3D dc->ddev;
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index 6e88f09..9a8140f 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -575,10 +575,11 @@ struct dma_device {
> =A0 =A0 =A0 =A0struct dma_async_tx_descriptor *(*device_prep_slave_sg=
)(
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct dma_chan *chan, struct scatterl=
ist *sgl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned int sg_len, enum dma_transfer=
_direction direction,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long flags);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long flags, void *context);
> =A0 =A0 =A0 =A0struct dma_async_tx_descriptor *(*device_prep_dma_cycl=
ic)(
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct dma_chan *chan, dma_addr_t buf_=
addr, size_t buf_len,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 size_t period_len, enum dma_transfer_di=
rection direction);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 size_t period_len, enum dma_transfer_di=
rection direction,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 void *context);
> =A0 =A0 =A0 =A0struct dma_async_tx_descriptor *(*device_prep_interlea=
ved_dma)(
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct dma_chan *chan, struct dma_inte=
rleaved_template *xt,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned long flags);
> @@ -612,7 +613,8 @@ static inline struct dma_async_tx_descriptor *dma=
engine_prep_slave_single(
> =A0 =A0 =A0 =A0struct scatterlist sg;
> =A0 =A0 =A0 =A0sg_init_one(&sg, buf, len);
>
> - =A0 =A0 =A0 return chan->device->device_prep_slave_sg(chan, &sg, 1,=
 dir, flags);
> + =A0 =A0 =A0 return chan->device->device_prep_slave_sg(chan, &sg, 1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dir, flags, NULL);
> =A0}
>
> =A0static inline struct dma_async_tx_descriptor *dmaengine_prep_slave=
_sg(
> @@ -620,7 +622,7 @@ static inline struct dma_async_tx_descriptor *dma=
engine_prep_slave_sg(
> =A0 =A0 =A0 =A0enum dma_transfer_direction dir, unsigned long flags)
> =A0{
> =A0 =A0 =A0 =A0return chan->device->device_prep_slave_sg(chan, sgl, s=
g_len,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dir, flags);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dir, flags, NULL);
> =A0}
>
> =A0static inline struct dma_async_tx_descriptor *dmaengine_prep_dma_c=
yclic(
> @@ -628,7 +630,7 @@ static inline struct dma_async_tx_descriptor *dma=
engine_prep_dma_cyclic(
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0size_t period_len, enum dma_transfer_d=
irection dir)
> =A0{
> =A0 =A0 =A0 =A0return chan->device->device_prep_dma_cyclic(chan, buf_=
addr, buf_len,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 period_len, dir);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 period_len, dir, NULL);
> =A0}
>
> =A0static inline int dmaengine_terminate_all(struct dma_chan *chan)
> --
> 1.7.8.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/

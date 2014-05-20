From: Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: linux-next: build failure after merge of the dma-buf tree
Date: Tue, 20 May 2014 14:39:10 +0530
Message-ID: <CAO_48GEhZGoY6A9MxuG5u=Nq2OqZ=D-W-npmH=33uMEw2=+vxw@mail.gmail.com>
References: <20140520171351.736fb238@canb.auug.org.au> <537B11C4.2010406@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <537B11C4.2010406@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thierry Reding <treding@nvidia.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 20 May 2014 13:56, Maarten Lankhorst <maarten.lankhorst@canonical.co=
m> wrote:
> Hey,
>
> op 20-05-14 09:13, Stephen Rothwell schreef:
>
>> Hi Sumit,
>>
>> After merging the dma-buf tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> drivers/gpu/drm/tegra/gem.c: In function 'tegra_gem_prime_export':
>> drivers/gpu/drm/tegra/gem.c:423:15: error: macro "dma_buf_export" re=
quires
>> 5 arguments, but only 4 given
>> drivers/gpu/drm/tegra/gem.c:422:9: error: 'dma_buf_export' undeclare=
d
>> (first use in this function)
>>
>> Caused by commit 8dfb1f0f8103 ("dma-buf: use reservation objects").
>> Grep is your friend ...
>>
>> I have use the dma-buf tree from next-20140519 for today.
>
>
> sumits can you amend the commit?
Hey Maarten,
Yes, I'll amend it and push.
> ---
>
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.=
c
> index bcf9895cef9f..1e9de41a14ea 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -419,7 +419,7 @@ struct dma_buf *tegra_gem_prime_export(struct drm=
_device
> *drm,
>                                        int flags)
>  {
>         return dma_buf_export(gem, &tegra_gem_prime_dmabuf_ops, gem->=
size,
> -                             flags);
> +                             flags, NULL);
>  }
>   struct drm_gem_object *tegra_gem_prime_import(struct drm_device *dr=
m,
>



--=20
Thanks and regards,

Sumit Semwal
Graphics Engineer - Graphics working group
Linaro.org =E2=94=82 Open source software for ARM SoCs

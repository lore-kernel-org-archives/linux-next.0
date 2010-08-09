From: Mike Rapoport <mike@compulab.co.il>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Mon, 09 Aug 2010 11:51:41 +0300
Message-ID: <4C5FC19D.6050100@compulab.co.il>
References: <20100809114042.7beb076a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100809114042.7beb076a.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Rapoport <mike@compulab.co.il>
List-Id: linux-next.vger.kernel.org

Hi Samuel,

Stephen Rothwell wrote:
> Hi Samuel,
> 
> After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/mfd/tps6586x.c: In function 'tps6586x_add_subdevs':
> drivers/mfd/tps6586x.c:272: error: dereferencing pointer to incomplete type
> drivers/mfd/tps6586x.c:273: error: dereferencing pointer to incomplete type
> drivers/mfd/tps6586x.c:275: error: dereferencing pointer to incomplete type
> drivers/mfd/tps6586x.c:275: error: dereferencing pointer to incomplete type
> drivers/mfd/tps6586x.c:278: error: dereferencing pointer to incomplete type
> drivers/mfd/tps6586x.c: In function 'tps6586x_i2c_probe':
> drivers/mfd/tps6586x.c:324: warning: passing argument 2 of 'tps6586x_add_subdevs' from incompatible pointer type
> drivers/mfd/tps6586x.c:265: note: expected 'struct tps6586x_platform_data *' but argument is of type 'struct tps6586x_platform_data *'
> drivers/mfd/tps6586x.c:330: error: dereferencing pointer to incomplete type
> 
> Caused by commit 8232c2794cf0e39b38d089eff49500461ecdbb8f ("mfd: Add
> TPS6586x driver").  "struct tps6586x_platform_data" is not defined
> anywhere ...

It seems to me that the include/linux/mfd/tps6586x.h was omitted from your 
commit to the mfd tree. Can you please check?

> I have used the mfd tree from next-20100807 for today.


-- 
Sincerely yours,
Mike.

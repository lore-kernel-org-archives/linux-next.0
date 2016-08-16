From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the sound-asoc tree
Date: Tue, 16 Aug 2016 11:36:01 +1000
Message-ID: <20160816113601.574c1fcf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Irina Tirdea <irina.tirdea@intel.com>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

WARNING: sound/soc/intel/boards/snd-soc-sst-bytcr-rt5640.o(.text+0x7e7): Section mismatch in reference from the function snd_byt_rt5640_mc_probe() to the variable .init.rodata:cpu_ids.43814
The function snd_byt_rt5640_mc_probe() references
the variable __initconst cpu_ids.43814.
This is often because snd_byt_rt5640_mc_probe lacks a __initconst 
annotation or the annotation of cpu_ids.43814 is wrong.

WARNING: sound/soc/intel/boards/snd-soc-sst-bytcr-rt5640.o(.text+0x9d5): Section mismatch in reference from the function snd_byt_rt5640_mc_probe() to the variable .init.rodata:cpu_ids.43814
The function snd_byt_rt5640_mc_probe() references
the variable __initconst cpu_ids.43814.
This is often because snd_byt_rt5640_mc_probe lacks a __initconst 
annotation or the annotation of cpu_ids.43814 is wrong.

WARNING: sound/soc/intel/atom/sst/snd-intel-sst-acpi.o(.text+0x20f): Section mismatch in reference from the function sst_acpi_probe() to the variable .init.rodata:cpu_ids.44453
The function sst_acpi_probe() references
the variable __initconst cpu_ids.44453.
This is often because sst_acpi_probe lacks a __initconst 
annotation or the annotation of cpu_ids.44453 is wrong.

WARNING: sound/soc/intel/atom/sst/snd-intel-sst-acpi.o(.text+0x20f): Section mismatch in reference from the function sst_acpi_probe() to the variable .init.rodata:cpu_ids.44453
The function sst_acpi_probe() references
the variable __initconst cpu_ids.44453.
This is often because sst_acpi_probe lacks a __initconst 
annotation or the annotation of cpu_ids.44453 is wrong.

WARNING: sound/soc/intel/boards/snd-soc-sst-bytcr-rt5640.o(.text+0x7e7): Section mismatch in reference from the function snd_byt_rt5640_mc_probe() to the variable .init.rodata:cpu_ids.43814
The function snd_byt_rt5640_mc_probe() references
the variable __initconst cpu_ids.43814.
This is often because snd_byt_rt5640_mc_probe lacks a __initconst 
annotation or the annotation of cpu_ids.43814 is wrong.

WARNING: sound/soc/intel/boards/snd-soc-sst-bytcr-rt5640.o(.text+0x9d5): Section mismatch in reference from the function snd_byt_rt5640_mc_probe() to the variable .init.rodata:cpu_ids.43814
The function snd_byt_rt5640_mc_probe() references
the variable __initconst cpu_ids.43814.
This is often because snd_byt_rt5640_mc_probe lacks a __initconst 
annotation or the annotation of cpu_ids.43814 is wrong.

I am not sure which commit(s) introduced these.

-- 
Cheers,
Stephen Rothwell

From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Subject: linux-next: build failure after merge of the sound-current
 tree
Date: Tue, 13 Jun 2017 09:49:45 +1000
Message-ID: <20170613094945.06fbd573@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41193 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753160AbdFLXts (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Jun 2017 19:49:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Takashi,

After merging the sound-current tree, today's linux-next build (x86_64
allmodconfig) failed like this:

sound/synth/emux/emux.c: In function 'snd_emux_new':
sound/synth/emux/emux.c:51:5: error: 'struct snd_emux' has no member named 'oss_synth'
  emu->oss_synth = NULL;
     ^
sound/drivers/opl3/opl3_oss.c:24:41: warning: 'struct snd_seq_oss_arg' declared inside parameter list
 static int snd_opl3_open_seq_oss(struct snd_seq_oss_arg *arg, void *closure);
                                         ^
sound/drivers/opl3/opl3_oss.c:24:41: warning: its scope is only this definition or declaration, which is probably not what you want
sound/drivers/opl3/opl3_oss.c:25:42: warning: 'struct snd_seq_oss_arg' declared inside parameter list
 static int snd_opl3_close_seq_oss(struct snd_seq_oss_arg *arg);
                                          ^
sound/drivers/opl3/opl3_oss.c:26:42: warning: 'struct snd_seq_oss_arg' declared inside parameter list
 static int snd_opl3_ioctl_seq_oss(struct snd_seq_oss_arg *arg, unsigned int cmd, unsigned long ioarg);
                                          ^
sound/drivers/opl3/opl3_oss.c:27:47: warning: 'struct snd_seq_oss_arg' declared inside parameter list
 static int snd_opl3_load_patch_seq_oss(struct snd_seq_oss_arg *arg, int format, const char __user *buf, int offs, int count);
                                               ^
sound/drivers/opl3/opl3_oss.c:28:42: warning: 'struct snd_seq_oss_arg' declared inside parameter list
 static int snd_opl3_reset_seq_oss(struct snd_seq_oss_arg *arg);
                                          ^
sound/drivers/opl3/opl3_oss.c:48:15: error: variable 'oss_callback' has initializer but incomplete type
 static struct snd_seq_oss_callback oss_callback = {
               ^
sound/drivers/opl3/opl3_oss.c:49:2: error: unknown field 'owner' specified in initializer
  .owner =  THIS_MODULE,
  ^
In file included from sound/drivers/opl3/opl3_oss.c:21:0:
include/linux/export.h:35:21: warning: excess elements in struct initializer
 #define THIS_MODULE (&__this_module)
                     ^
sound/drivers/opl3/opl3_oss.c:49:12: note: in expansion of macro 'THIS_MODULE'
  .owner =  THIS_MODULE,
            ^
include/linux/export.h:35:21: note: (near initialization for 'oss_callback')
 #define THIS_MODULE (&__this_module)
                     ^
sound/drivers/opl3/opl3_oss.c:49:12: note: in expansion of macro 'THIS_MODULE'
  .owner =  THIS_MODULE,
            ^
sound/drivers/opl3/opl3_oss.c:50:2: error: unknown field 'open' specified in initializer
  .open =  snd_opl3_open_seq_oss,
  ^
sound/drivers/opl3/opl3_oss.c:50:11: warning: excess elements in struct initializer
  .open =  snd_opl3_open_seq_oss,
           ^
sound/drivers/opl3/opl3_oss.c:50:11: note: (near initialization for 'oss_callback')
sound/drivers/opl3/opl3_oss.c:51:2: error: unknown field 'close' specified in initializer
  .close = snd_opl3_close_seq_oss,
  ^
sound/drivers/opl3/opl3_oss.c:51:11: warning: excess elements in struct initializer
  .close = snd_opl3_close_seq_oss,
           ^
sound/drivers/opl3/opl3_oss.c:51:11: note: (near initialization for 'oss_callback')
sound/drivers/opl3/opl3_oss.c:52:2: error: unknown field 'ioctl' specified in initializer
  .ioctl = snd_opl3_ioctl_seq_oss,
  ^
sound/drivers/opl3/opl3_oss.c:52:11: warning: excess elements in struct initializer
  .ioctl = snd_opl3_ioctl_seq_oss,
           ^
sound/drivers/opl3/opl3_oss.c:52:11: note: (near initialization for 'oss_callback')
sound/drivers/opl3/opl3_oss.c:53:2: error: unknown field 'load_patch' specified in initializer
  .load_patch = snd_opl3_load_patch_seq_oss,
  ^
sound/drivers/opl3/opl3_oss.c:53:16: warning: excess elements in struct initializer
  .load_patch = snd_opl3_load_patch_seq_oss,
                ^
sound/drivers/opl3/opl3_oss.c:53:16: note: (near initialization for 'oss_callback')
sound/drivers/opl3/opl3_oss.c:54:2: error: unknown field 'reset' specified in initializer
  .reset = snd_opl3_reset_seq_oss,
  ^
sound/drivers/opl3/opl3_oss.c:54:11: warning: excess elements in struct initializer
  .reset = snd_opl3_reset_seq_oss,
           ^
sound/drivers/opl3/opl3_oss.c:54:11: note: (near initialization for 'oss_callback')
sound/drivers/opl3/opl3_oss.c: In function 'snd_opl3_oss_event_input':
sound/drivers/opl3/opl3_oss.c:63:45: error: 'struct snd_opl3' has no member named 'oss_chset'
   snd_midi_process_event(&opl3_ops, ev, opl3->oss_chset);
                                             ^
sound/drivers/opl3/opl3_oss.c: In function 'snd_opl3_oss_free_port':
sound/drivers/opl3/opl3_oss.c:73:32: error: 'struct snd_opl3' has no member named 'oss_chset'
  snd_midi_channel_free_set(opl3->oss_chset);
                                ^
sound/drivers/opl3/opl3_oss.c: In function 'snd_opl3_oss_create_port':
sound/drivers/opl3/opl3_oss.c:84:6: error: 'struct snd_opl3' has no member named 'oss_chset'
  opl3->oss_chset = snd_midi_channel_alloc_set(voices);
      ^
sound/drivers/opl3/opl3_oss.c:85:10: error: 'struct snd_opl3' has no member named 'oss_chset'
  if (opl3->oss_chset == NULL)
          ^
sound/drivers/opl3/opl3_oss.c:87:6: error: 'struct snd_opl3' has no member named 'oss_chset'
  opl3->oss_chset->private_data = opl3;
      ^
sound/drivers/opl3/opl3_oss.c:98:6: error: 'struct snd_opl3' has no member named 'oss_chset'
  opl3->oss_chset->client = opl3->seq_client;
      ^
sound/drivers/opl3/opl3_oss.c:99:6: error: 'struct snd_opl3' has no member named 'oss_chset'
  opl3->oss_chset->port = snd_seq_event_port_attach(opl3->seq_client, &callbacks,
      ^
sound/drivers/opl3/opl3_oss.c:107:10: error: 'struct snd_opl3' has no member named 'oss_chset'
  if (opl3->oss_chset->port < 0) {
          ^
sound/drivers/opl3/opl3_oss.c:109:14: error: 'struct snd_opl3' has no member named 'oss_chset'
   port = opl3->oss_chset->port;
              ^
sound/drivers/opl3/opl3_oss.c:110:33: error: 'struct snd_opl3' has no member named 'oss_chset'
   snd_midi_channel_free_set(opl3->oss_chset);
                                 ^
sound/drivers/opl3/opl3_oss.c: In function 'snd_opl3_init_seq_oss':
sound/drivers/opl3/opl3_oss.c:124:40: error: 'SNDRV_SEQ_DEV_ID_OSS' undeclared (first use in this function)
  if (snd_seq_device_new(opl3->card, 0, SNDRV_SEQ_DEV_ID_OSS,
                                        ^
sound/drivers/opl3/opl3_oss.c:124:40: note: each undeclared identifier is reported only once for each function it appears in
sound/drivers/opl3/opl3_oss.c:125:18: error: invalid application of 'sizeof' to incomplete type 'struct snd_seq_oss_reg'
           sizeof(struct snd_seq_oss_reg), &dev) < 0)
                  ^
sound/drivers/opl3/opl3_oss.c:128:6: error: 'struct snd_opl3' has no member named 'oss_seq_dev'
  opl3->oss_seq_dev = dev;
      ^
sound/drivers/opl3/opl3_oss.c:131:5: error: dereferencing pointer to incomplete type 'struct snd_seq_oss_reg'
  arg->type = SYNTH_TYPE_FM;
     ^
sound/drivers/opl3/opl3_oss.c:131:14: error: 'SYNTH_TYPE_FM' undeclared (first use in this function)
  arg->type = SYNTH_TYPE_FM;
              ^
sound/drivers/opl3/opl3_oss.c:133:18: error: 'FM_TYPE_ADLIB' undeclared (first use in this function)
   arg->subtype = FM_TYPE_ADLIB;
                  ^
sound/drivers/opl3/opl3_oss.c:136:18: error: 'FM_TYPE_OPL3' undeclared (first use in this function)
   arg->subtype = FM_TYPE_OPL3;
                  ^
sound/drivers/opl3/opl3_oss.c: In function 'snd_opl3_free_seq_oss':
sound/drivers/opl3/opl3_oss.c:151:10: error: 'struct snd_opl3' has no member named 'oss_seq_dev'
  if (opl3->oss_seq_dev) {
          ^
sound/drivers/opl3/opl3_oss.c:153:7: error: 'struct snd_opl3' has no member named 'oss_seq_dev'
   opl3->oss_seq_dev = NULL;
       ^
sound/drivers/opl3/opl3_oss.c: At top level:
sound/drivers/opl3/opl3_oss.c:160:41: warning: 'struct snd_seq_oss_arg' declared inside parameter list
 static int snd_opl3_open_seq_oss(struct snd_seq_oss_arg *arg, void *closure)
                                         ^
sound/drivers/opl3/opl3_oss.c:160:12: error: conflicting types for 'snd_opl3_open_seq_oss'
 static int snd_opl3_open_seq_oss(struct snd_seq_oss_arg *arg, void *closure)
            ^
sound/drivers/opl3/opl3_oss.c:24:12: note: previous declaration of 'snd_opl3_open_seq_oss' was here
 static int snd_opl3_open_seq_oss(struct snd_seq_oss_arg *arg, void *closure);
            ^
sound/drivers/opl3/opl3_oss.c: In function 'snd_opl3_open_seq_oss':
sound/drivers/opl3/opl3_oss.c:172:5: error: dereferencing pointer to incomplete type 'struct snd_seq_oss_arg'
  arg->private_data = opl3;
     ^
sound/drivers/opl3/opl3_oss.c:173:25: error: 'struct snd_opl3' has no member named 'oss_chset'
  arg->addr.client = opl3->oss_chset->client;
                         ^
sound/drivers/opl3/opl3_oss.c:174:23: error: 'struct snd_opl3' has no member named 'oss_chset'
  arg->addr.port = opl3->oss_chset->port;
                       ^
sound/drivers/opl3/opl3_oss.c: At top level:
sound/drivers/opl3/opl3_oss.c:184:42: warning: 'struct snd_seq_oss_arg' declared inside parameter list
 static int snd_opl3_close_seq_oss(struct snd_seq_oss_arg *arg)
                                          ^
sound/drivers/opl3/opl3_oss.c:184:12: error: conflicting types for 'snd_opl3_close_seq_oss'
 static int snd_opl3_close_seq_oss(struct snd_seq_oss_arg *arg)
            ^
sound/drivers/opl3/opl3_oss.c:25:12: note: previous declaration of 'snd_opl3_close_seq_oss' was here
 static int snd_opl3_close_seq_oss(struct snd_seq_oss_arg *arg);
            ^
sound/drivers/opl3/opl3_oss.c: In function 'snd_opl3_close_seq_oss':
sound/drivers/opl3/opl3_oss.c:190:12: error: dereferencing pointer to incomplete type 'struct snd_seq_oss_arg'
  opl3 = arg->private_data;
            ^
sound/drivers/opl3/opl3_oss.c: At top level:
sound/drivers/opl3/opl3_oss.c:204:12: warning: 'struct snd_seq_oss_arg' declared inside parameter list
            const char __user *buf, int offs, int count)
            ^
sound/drivers/opl3/opl3_oss.c:203:12: error: conflicting types for 'snd_opl3_load_patch_seq_oss'
 static int snd_opl3_load_patch_seq_oss(struct snd_seq_oss_arg *arg, int format,
            ^
sound/drivers/opl3/opl3_oss.c:27:12: note: previous declaration of 'snd_opl3_load_patch_seq_oss' was here
 static int snd_opl3_load_patch_seq_oss(struct snd_seq_oss_arg *arg, int format, const char __user *buf, int offs, int count);
            ^
sound/drivers/opl3/opl3_oss.c: In function 'snd_opl3_load_patch_seq_oss':
sound/drivers/opl3/opl3_oss.c:207:24: error: storage size of 'sbi' isn't known
  struct sbi_instrument sbi;
                        ^
sound/drivers/opl3/opl3_oss.c:213:12: error: dereferencing pointer to incomplete type 'struct snd_seq_oss_arg'
  opl3 = arg->private_data;
            ^
sound/drivers/opl3/opl3_oss.c:215:16: error: 'FM_PATCH' undeclared (first use in this function)
  if (format == FM_PATCH)
                ^
sound/drivers/opl3/opl3_oss.c:217:21: error: 'OPL3_PATCH' undeclared (first use in this function)
  else if (format == OPL3_PATCH)
                     ^
sound/drivers/opl3/opl3_oss.c:207:24: warning: unused variable 'sbi' [-Wunused-variable]
  struct sbi_instrument sbi;
                        ^
sound/drivers/opl3/opl3_oss.c: At top level:
sound/drivers/opl3/opl3_oss.c:248:7: warning: 'struct snd_seq_oss_arg' declared inside parameter list
       unsigned long ioarg)
       ^
sound/drivers/opl3/opl3_oss.c:247:12: error: conflicting types for 'snd_opl3_ioctl_seq_oss'
 static int snd_opl3_ioctl_seq_oss(struct snd_seq_oss_arg *arg, unsigned int cmd,
            ^
sound/drivers/opl3/opl3_oss.c:26:12: note: previous declaration of 'snd_opl3_ioctl_seq_oss' was here
 static int snd_opl3_ioctl_seq_oss(struct snd_seq_oss_arg *arg, unsigned int cmd, unsigned long ioarg);
            ^
sound/drivers/opl3/opl3_oss.c: In function 'snd_opl3_ioctl_seq_oss':
sound/drivers/opl3/opl3_oss.c:254:12: error: dereferencing pointer to incomplete type 'struct snd_seq_oss_arg'
  opl3 = arg->private_data;
            ^
sound/drivers/opl3/opl3_oss.c:256:8: error: 'SNDCTL_FM_LOAD_INSTR' undeclared (first use in this function)
   case SNDCTL_FM_LOAD_INSTR:
        ^
sound/drivers/opl3/opl3_oss.c:262:8: error: 'SNDCTL_SYNTH_MEMAVL' undeclared (first use in this function)
   case SNDCTL_SYNTH_MEMAVL:
        ^
sound/drivers/opl3/opl3_oss.c:265:8: error: 'SNDCTL_FM_4OP_ENABLE' undeclared (first use in this function)
   case SNDCTL_FM_4OP_ENABLE:
        ^
sound/drivers/opl3/opl3_oss.c: At top level:
sound/drivers/opl3/opl3_oss.c:276:42: warning: 'struct snd_seq_oss_arg' declared inside parameter list
 static int snd_opl3_reset_seq_oss(struct snd_seq_oss_arg *arg)
                                          ^
sound/drivers/opl3/opl3_oss.c:276:12: error: conflicting types for 'snd_opl3_reset_seq_oss'
 static int snd_opl3_reset_seq_oss(struct snd_seq_oss_arg *arg)
            ^
sound/drivers/opl3/opl3_oss.c:28:12: note: previous declaration of 'snd_opl3_reset_seq_oss' was here
 static int snd_opl3_reset_seq_oss(struct snd_seq_oss_arg *arg);
            ^
sound/drivers/opl3/opl3_oss.c: In function 'snd_opl3_reset_seq_oss':
sound/drivers/opl3/opl3_oss.c:282:12: error: dereferencing pointer to incomplete type 'struct snd_seq_oss_arg'
  opl3 = arg->private_data;
            ^
sound/drivers/opl3/opl3_oss.c: At top level:
sound/drivers/opl3/opl3_oss.c:24:12: warning: 'snd_opl3_open_seq_oss' used but never defined
 static int snd_opl3_open_seq_oss(struct snd_seq_oss_arg *arg, void *closure);
            ^
sound/drivers/opl3/opl3_oss.c:25:12: warning: 'snd_opl3_close_seq_oss' used but never defined
 static int snd_opl3_close_seq_oss(struct snd_seq_oss_arg *arg);
            ^
sound/drivers/opl3/opl3_oss.c:26:12: warning: 'snd_opl3_ioctl_seq_oss' used but never defined
 static int snd_opl3_ioctl_seq_oss(struct snd_seq_oss_arg *arg, unsigned int cmd, unsigned long ioarg);
            ^
sound/drivers/opl3/opl3_oss.c:27:12: warning: 'snd_opl3_load_patch_seq_oss' used but never defined
 static int snd_opl3_load_patch_seq_oss(struct snd_seq_oss_arg *arg, int format, const char __user *buf, int offs, int count);
            ^
sound/drivers/opl3/opl3_oss.c:28:12: warning: 'snd_opl3_reset_seq_oss' used but never defined
 static int snd_opl3_reset_seq_oss(struct snd_seq_oss_arg *arg);
            ^
sound/drivers/opl3/opl3_oss.c:160:12: warning: 'snd_opl3_open_seq_oss' defined but not used [-Wunused-function]
 static int snd_opl3_open_seq_oss(struct snd_seq_oss_arg *arg, void *closure)
            ^
sound/drivers/opl3/opl3_oss.c:184:12: warning: 'snd_opl3_close_seq_oss' defined but not used [-Wunused-function]
 static int snd_opl3_close_seq_oss(struct snd_seq_oss_arg *arg)
            ^
sound/drivers/opl3/opl3_oss.c:203:12: warning: 'snd_opl3_load_patch_seq_oss' defined but not used [-Wunused-function]
 static int snd_opl3_load_patch_seq_oss(struct snd_seq_oss_arg *arg, int format,
            ^
sound/drivers/opl3/opl3_oss.c:247:12: warning: 'snd_opl3_ioctl_seq_oss' defined but not used [-Wunused-function]
 static int snd_opl3_ioctl_seq_oss(struct snd_seq_oss_arg *arg, unsigned int cmd,
            ^
sound/drivers/opl3/opl3_oss.c:276:12: warning: 'snd_opl3_reset_seq_oss' defined but not used [-Wunused-function]
 static int snd_opl3_reset_seq_oss(struct snd_seq_oss_arg *arg)
            ^

Probabaly caused by commit

  d710684b7e2e ("ALSA: seq: Allow the tristate build of OSS emulation")

At least include/sound/emux_synth.h has not bee updated appropriately
for that change.

Is this size of change really appropriate after -rc5?  I assume it
was intended to go into Linus' tree before v4.12 as it is in the
sound-current tree.

I have dropped the sound-current tree for today.
-- 
Cheers,
Stephen Rothwell
